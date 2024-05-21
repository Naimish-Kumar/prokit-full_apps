import 'package:flutter/material.dart';
import 'package:proscan/screens/account_screen.dart';
import 'package:proscan/utils/color.dart';
import 'package:proscan/utils/common.dart';
import 'package:proscan/utils/constant.dart';

import '../models/faq_model.dart';
import '../utils/images.dart';
import '../utils/lists.dart';

class FAQScreen extends StatefulWidget {
  FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  int selectedIndex = 0;
  bool isTapped = false;
  bool backgroundColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: ListView.builder(
              itemCount: faqScreenOptions.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    selectedIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: mode.theme
                          ? selectedIndex == index
                              ? primaryColor
                              : Colors.transparent
                          : selectedIndex == index
                              ? primaryColor
                              : Colors.white,
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                    ),
                    child: Text(
                      faqScreenOptions[index],
                      style: primaryTextStyle(color: selectedIndex == index ? Colors.white : primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      onTap: () {
                        backgroundColor = true;
                        setState(() {});
                      },
                      onFieldSubmitted: (value) {
                        backgroundColor = false;
                        setState(() {});
                      },
                      decoration: inputDecoration(
                        hintText: "Search",
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS), borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS), borderSide: BorderSide(color: primaryColor)),
                        filled: true,
                        fillColor: mode.theme
                            ? backgroundColor
                                ? Color(0xFF1c2031)
                                : darkPrimaryLightColor
                            : backgroundColor
                                ? primaryLightColor
                                : Colors.grey.shade200,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Image.asset(search_image, height: 20, width: 20, color: Colors.grey.shade500),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                              //
                            },
                            child: Image.asset(filter_image, height: 20, color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: helpCenterQuestionList.length,
                    itemBuilder: (context, int index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: mode.theme ? Colors.white30 : Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(helpCenterQuestionList[index].title!,
                                        overflow: TextOverflow.visible, style: boldTextStyle(fontSize: 18))),
                                IconButton(
                                  splashRadius: 24,
                                  onPressed: () {
                                    helpCenterQuestionList[index].isTapped = !helpCenterQuestionList[index].isTapped!;
                                    setState(() {});
                                  },
                                  icon: helpCenterQuestionList[index].isTapped!
                                      ? Icon(Icons.arrow_drop_up_rounded, color: primaryColor, size: 30)
                                      : Icon(Icons.arrow_drop_down_rounded, color: primaryColor, size: 30),
                                ),
                              ],
                            ),
                            helpCenterQuestionList[index].isTapped!
                                ? Column(
                                    children: [
                                      Divider(),
                                      SizedBox(height: 8),
                                      Text(
                                        "Lorem ipsum dolor sit amet, consecrate disciplining elite, sed do usermod temper incident ut labor et do lore magna aliquot.",
                                        // helpCenterQuestionList[index].description!,
                                        style: secondaryTextStyle(),
                                      ),
                                      SizedBox(height: 8)
                                    ],
                                  )
                                : Offstage(),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
