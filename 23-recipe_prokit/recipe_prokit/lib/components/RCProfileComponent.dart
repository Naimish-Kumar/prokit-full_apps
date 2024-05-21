import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:recipe_prokit/components/RCBackComponent.dart';
import 'package:recipe_prokit/components/RCStoryComponent.dart';
import 'package:recipe_prokit/main.dart';
import 'package:recipe_prokit/models/RCHomeStoryModel.dart';
import 'package:recipe_prokit/screens/RCSearchStoryScreen.dart';
import 'package:recipe_prokit/utils/RCBottomSheet.dart';
import 'package:recipe_prokit/utils/RCColors.dart';

import 'RCMiniStoryComponent.dart';

class RCProfileScreen extends StatefulWidget {
  @override
  State<RCProfileScreen> createState() => _RCProfileScreenState();
}

class _RCProfileScreenState extends State<RCProfileScreen> {
  int selectedIndex = 0;

  List<RCHomeStoryModel> bolgList = getHomeStoryList();
  List<RCHomeStoryModel> recipeList = getSearchRecipeList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            (context.statusBarHeight + 10).toInt().height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RCBackComponent(color: appStore.isDarkModeOn ? Colors.white : Colors.black, borderColor: rcSecondaryTextColor),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: rcSecondaryTextColor), borderRadius: radius(16)),
                  child: IconButton(
                    icon: Icon(Icons.share, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                    onPressed: () {
                      showShareBottomSheet(context);
                    },
                  ),
                ),
              ],
            ).paddingAll(16),
            Align(
              alignment: Alignment.topRight,
              child: Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  setState(() {});
                  appStore.toggleDarkMode(value: s);
                },
              ),
            ),
            Image.asset('images/recipe/faceOne.jpg', height: 200, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(32).center(),
            20.height,
            Text('Melanes Horn', style: boldTextStyle(size: 20, fontFamily: GoogleFonts.playfairDisplay().fontFamily)),
            8.height,
            Text('Kitchen Stories', style: secondaryTextStyle(color: rcSecondaryTextColor)),
            20.height,
            Text('Gloriously fermented in Sichuan', style: primaryTextStyle()),
            20.height,
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(borderRadius: radius(16), color: rcSecondaryColor),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: radius(16), color: selectedIndex == 0 ? primaryColor : rcSecondaryColor),
                    child: Row(
                      children: [
                        Icon(LineIcons.cookie, color: selectedIndex == 0 ? Colors.white : rcSecondaryTextColor),
                        4.width,
                        Text('Recipe', style: boldTextStyle(color: selectedIndex == 0 ? Colors.white : rcSecondaryTextColor)),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                  ).onTap(() {
                    selectedIndex = 0;
                    setState(() {});
                  }),
                  Container(
                    decoration: BoxDecoration(borderRadius: radius(16), color: selectedIndex == 1 ? primaryColor : rcSecondaryColor),
                    child: Row(
                      children: [
                        Icon(LineIcons.newspaper, color: selectedIndex == 1 ? Colors.white : rcSecondaryTextColor),
                        4.width,
                        Text('Blog', style: boldTextStyle(color: selectedIndex == 1 ? Colors.white : rcSecondaryTextColor)),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                  ).onTap(() {
                    selectedIndex = 1;
                    setState(() {});
                  }),
                ],
              ),
            ),
            20.height,
            selectedIndex == 0
                ? Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    children: recipeList.map((e) {
                      return RCMiniStoryComponentRecipe(element: e, isProfile: true).onTap(() {
                        RCSearchStoryScreen(element: e).launch(context);
                      },splashColor: Colors.transparent,highlightColor: Colors.transparent);
                    }).toList(),
                  ).paddingSymmetric(horizontal: 20)
                : Wrap(
                    runSpacing: 16,
                    children: bolgList.map((e) {
                      return RCStoryComponent(element: e, isProfile: true);
                    }).toList(),
                  ).paddingSymmetric(horizontal: 20),
            80.height,
          ],
        ),
      ),
    );
  }
}
