import 'package:flutter/material.dart';
import 'package:proscan/screens/account_screen.dart';

import '../models/dashboard_model_class.dart';
import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';

Future<dynamic> RecentFilesShareBottomSheetComponent(BuildContext context, double height) {
  return showModalBottomSheet(
    backgroundColor: mode.theme ? darkPrimaryLightColor : Colors.white,
    enableDrag: true,
    isScrollControlled: true,
    shape: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.vertical(top: Radius.circular(DEFAULT_RADIUS))),
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.5,
        maxChildSize: 0.55,
        minChildSize: 0.3,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              height: height * 0.5,
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Container(
                    height: 2,
                    width: 40,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
                  ),
                  SizedBox(height: 16),
                  Text("Share", style: boldTextStyle(fontSize: 24)),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: recentFileShareOptions.length,
                      padding: EdgeInsets.only(bottom: 16),
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        return InkWell(
                          onTap: () {
                            //
                          },
                          child: ListTile(
                            title: RichText(
                                text: TextSpan(
                                    text: "${recentFileShareOptions[index].Text.toString()} ",
                                    style: primaryTextStyle(),
                                    children: [TextSpan(text: "${recentFileShareOptions[index].size}", style: secondaryTextStyle())])),
                            leading: Image.asset(recentFileShareOptions[index].image.toString(),
                                height: 20, color: mode.theme ? Colors.white : Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
