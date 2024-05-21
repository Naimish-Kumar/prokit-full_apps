import 'package:flutter/material.dart';
import 'package:prokit_flutter/utils/constants.dart';

TextStyle primaryTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: FontWeight.normal,
    color: color ?? Colors.white,
  );
}

TextStyle secondaryTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.white70,
  );
}

TextStyle boldTextStyle({double? fontSize, Color? color}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.white,
  );
}

BoxConstraints textFormFieldBoxConstraints({double? minWidth, double? maxWidth, double? minHeight, double? maxHeight}) {
  return BoxConstraints(
    minWidth: minWidth ?? 50,
    maxWidth: maxWidth ?? 100,
    minHeight: minHeight ?? 50,
    maxHeight: maxHeight ?? 60,
  );
}

Widget customDots(int currentIndex, int index) {
  return Container(
    height: 8,
    width: currentIndex == index ? 30 : 8,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: currentIndex == index ? Colors.red : Colors.grey.shade600),
  );
}

Widget titleRow(int index, {List? titleList}) {
  return Row(
    children: [
      if (titleList![index].isNotEmpty)
        Text(
          titleList[index],
          style: primaryTextStyle(fontSize: 24),
        ),
      TextButton(
        onPressed: () => {},
        child: Text('See all >', style: secondaryTextStyle(color: Colors.white60, fontSize: 12)),
      )
    ],
  );
}

Widget redirectionButtonContainer({
  String? title,
  double? borderRadius,
  Color? color,
  double? width,
  double? height,
}) {
  return Container(
    height: height ?? 40,
    width: width ?? 100,
    alignment: Alignment.center,
    decoration: BoxDecoration(color: color ?? Colors.red, borderRadius: BorderRadius.circular(borderRadius ?? 4)),
    child: Text(title!, style: boldTextStyle()),
  );
}

Widget backButton({Color? backgroundColor}) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: BorderRadius.circular(28),
    ),
    child: Icon(
      Icons.arrow_back_ios_rounded,
      size: 22,
      color: Colors.white70,
    ),
  );
}

Widget trailingIcon({IconData? icon, Color? color, double? size}) {
  return Icon(
    icon ?? Icons.arrow_forward_ios_rounded,
    color: color ?? Colors.white60,
    size: size ?? 16,
  );
}

Widget actorImageItem({String? imageName, String? name}) {
  return Container(
    width: 88,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          child: Image.asset(imageName ?? DEFAULT_USER, height: 90, width: 88, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(14),
        ),
        SizedBox(height: 8),
        Text(name!, textAlign: TextAlign.center, style: primaryTextStyle(fontSize: 14)),
      ],
    ),
  );
}

Widget moviePoster({String? imageName, String? title}) {
  return Wrap(
    runSpacing: 8,
    children: [
      ClipRRect(
        child: Image.asset(imageName!, height: 200, width: 130, fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(14),
      ),
      Text(title ?? '', textAlign: TextAlign.left, style: boldTextStyle(fontSize: 14)),
    ],
  );
}

Widget titleRowItem({String? title, Function()? onTap, required bool isSeeAll}) {
  return Row(
    children: [
      SizedBox(width: 16),
      Expanded(
        child: Text(
          title ?? 'Title',
          textAlign: TextAlign.left,
          style: boldTextStyle(fontSize: 20),
        ),
      ),
      if (isSeeAll)
        TextButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            visualDensity: VisualDensity.compact,
          ),
          onPressed: onTap,
          child: Text('See all>', style: secondaryTextStyle(fontSize: 12)),
        ),
      SizedBox(width: 16)
    ],
  );
}

Widget customFloatingButton({double? paddingValue, double? size, IconData? icon}) {
  return Container(
    padding: EdgeInsets.all(paddingValue ?? 8),
    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
    child: Icon(icon ?? Icons.play_arrow_rounded, size: size ?? 20, color: Colors.white),
  );
}
