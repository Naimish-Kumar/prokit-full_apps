import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:recipe_prokit/components/RCBackComponent.dart';
import 'package:recipe_prokit/main.dart';
import 'package:recipe_prokit/models/RCCollectionModel.dart';
import 'package:recipe_prokit/models/RCHomeStoryModel.dart';
import 'package:recipe_prokit/screens/RCRecipeScreen.dart';
import 'package:recipe_prokit/screens/RCVideoPlayerScreen.dart';
import 'package:recipe_prokit/utils/RCBottomSheet.dart';
import 'package:recipe_prokit/utils/RCClipperPaths.dart';
import 'package:recipe_prokit/utils/RCColors.dart';
import 'package:recipe_prokit/utils/RCCommon.dart';

class RCSearchStoryScreen extends StatefulWidget {
  RCHomeStoryModel element;

  RCSearchStoryScreen({required this.element});

  @override
  _RCSearchStoryScreenState createState() => _RCSearchStoryScreenState();
}

class _RCSearchStoryScreenState extends State<RCSearchStoryScreen> {
  List<RCCollectionModel> collectionList = [];

  @override
  void initState() {
    super.initState();

    collectionList.add(RCCollectionModel(name: 'Cookbook', image: 'images/recipe/strawberryCupcake.jpg', numberOfPosts: '15', selected: false));
    collectionList.add(RCCollectionModel(name: 'Ice Cream', image: 'images/recipe/strawberryCupcake.jpg', numberOfPosts: '3', selected: false));
    collectionList.add(RCCollectionModel(name: 'Cake Recipe', image: 'images/recipe/strawberryCupcake.jpg', numberOfPosts: '48', selected: false));

    setStatusBarColor(Colors.transparent);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? Colors.black : Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('images/recipe/panCake.jpg', height: context.height(), width: context.width(), fit: BoxFit.cover),
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RCBackComponent(color: Colors.white, borderColor: Colors.white),
                ).paddingSymmetric(vertical: context.statusBarHeight + 20, horizontal: 16),
                120.height,
                Icon(Icons.play_circle, size: 100, color: Colors.white).onTap(() {
                  RCVideoPlayerScreen().launch(context);
                }),
                140.height,
                SizedBox(
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: BackgroundClipperOne(),
                        child: Container(
                          padding: EdgeInsets.all(16),
                          width: context.width() - 32,
                          height: 210,
                          decoration: BoxDecoration(borderRadius: radius(30), color: appStore.isDarkModeOn ? Colors.black : Colors.white),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  profileImage(widget.element.img, 40, 40),
                                  8.width,
                                  Text(widget.element.name, style: boldTextStyle(color: primaryColor))
                                ],
                              ),
                              8.height,
                              Text('Spaghetti', style: boldTextStyle(fontFamily: GoogleFonts.playfairDisplay().fontFamily, size: 20)),
                              8.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(5, (index) {
                                    if (index == 4) {
                                      return Icon(LineIcons.star_1, color: rcSecondaryColor);
                                    }
                                    return Icon(LineIcons.star_1, color: primaryColor);
                                  }),
                                  8.width,
                                  Text('(729 ratings)', style: secondaryTextStyle())
                                ],
                              ),
                              16.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ClipPath(
                                    clipper: BackgroundClipperTwo(),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: widget.element.selected ? Colors.red.withAlpha(30) : rcSecondaryColor, borderRadius: radius(12)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          widget.element.selected
                                              ? Icon(LineIcons.heart_1, color: Colors.red)
                                              : Icon(LineIcons.heart, color: rcSecondaryTextColor),
                                          4.width,
                                          Text(widget.element.likes.toString(),
                                              style: secondaryTextStyle(
                                                  weight: FontWeight.bold, color: widget.element.selected ? Colors.red : rcSecondaryTextColor))
                                        ],
                                      ),
                                    ).onTap(() {
                                      widget.element.selected = !widget.element.selected;
                                      setState(() {});
                                    }),
                                  ),
                                  ClipPath(
                                    clipper: BackgroundClipperTwo(),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: rcSecondaryColor, borderRadius: radius(12)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(LineIcons.bookmark, color: rcSecondaryTextColor),
                                          4.width,
                                          Text('Save', style: secondaryTextStyle(weight: FontWeight.bold, color: rcSecondaryTextColor))
                                        ],
                                      ),
                                    ).onTap(() {
                                      showSaveBottomSheet(context, collectionList);
                                    }),
                                  ),
                                  ClipPath(
                                    clipper: BackgroundClipperTwo(),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: rcSecondaryColor, borderRadius: radius(12)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.share, color: rcSecondaryTextColor),
                                          4.width,
                                          Text('Share', style: secondaryTextStyle(weight: FontWeight.bold, color: rcSecondaryTextColor))
                                        ],
                                      ),
                                    ).onTap(
                                      () {
                                        showShareBottomSheet(context);
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          decoration: BoxDecoration(color: primaryColor, borderRadius: radius(16)),
                          margin: EdgeInsets.all(8),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward, color: Colors.white),
                            onPressed: () {
                              RCRecipeScreen(element: widget.element, collectionList: collectionList).launch(context);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ).paddingBottom(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
