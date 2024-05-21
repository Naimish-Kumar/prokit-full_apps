import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_prokit/main.dart';
import 'package:recipe_prokit/models/RCSearchModel.dart';
import 'package:recipe_prokit/screens/RCSearchedComponentScreen.dart';
import 'package:recipe_prokit/utils/RCColors.dart';

class RCSearchScreen extends StatelessWidget {
  List<RCSearchModel> list = getShareNameList();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (context.statusBarHeight + 16).toInt().height,
          Text('Search', style: boldTextStyle(size: 30, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
          16.height,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: boxDecorationDefault(borderRadius: radius(16), color: appStore.isDarkModeOn ? rcSecondaryTextColor : rcSecondaryColor),
            child: Row(
              children: [
                Icon(LineIcons.search),
                8.width,
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  textStyle: boldTextStyle(),
                  decoration: InputDecoration(hintText: 'Search', hintStyle: secondaryTextStyle(), border: InputBorder.none),
                ).expand()
              ],
            ),
          ),
          16.height,
          Text('Suggest', style: boldTextStyle()),
          16.height,
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: list.map((e) {
              return Container(
                width: context.width() / 3 - 16,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: radius(16),
                  color: appStore.isDarkModeOn ? rcSecondaryTextColor : rcSecondaryColor,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Image.asset(e.image, height: 80),
                  16.height,
                  Text(e.name, style: secondaryTextStyle()),
                ]),
              ).onTap(() {
                RCSearchedComponentScreen(element: e).launch(context);
              }, splashColor: Colors.transparent, highlightColor: Colors.transparent);
            }).toList(),
          )
        ],
      ).paddingAll(16),
    );
  }
}
