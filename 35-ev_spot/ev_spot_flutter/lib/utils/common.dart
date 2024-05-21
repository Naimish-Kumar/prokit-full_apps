import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/utils/colors.dart';
import 'package:ev_spot_flutter/utils/constant.dart';
import 'package:flutter/material.dart';

TextStyle primaryTextStyle({Color? color, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color == null
        ? appStore.isDarkMode
            ? Colors.white
            : textThemePrimaryColor
        : color,
  );
}

TextStyle boldTextStyle({Color? color, double? fontSize}) {
  return TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color ?? textBoldColor);
}

TextStyle secondaryTextStyle({Color? color, double? fontSize}) {
  return TextStyle(fontSize: fontSize ?? 14, color: color ?? textSecondaryColor);
}

InputDecoration inputDecoration(BuildContext context, {String? hintText, InputBorder? inputBorder}) {
  return InputDecoration(
    border: inputBorder ?? OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
    hintText: hintText ?? '',
    hintStyle: secondaryTextStyle(color: Colors.grey),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
  );
}
