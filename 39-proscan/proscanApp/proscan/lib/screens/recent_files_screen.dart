import 'package:flutter/material.dart';

import '../component/folder_bottom_sheet_component.dart';
import '../component/recent_files_menu_options_bottom_sheet_component.dart';
import '../component/recent_files_share_bottom_sheet_component.dart';
import '../models/dashboard_model_class.dart';
import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import '../utils/images.dart';
import '../utils/lists.dart';
import 'account_screen.dart';

class RecentFilesScreen extends StatefulWidget {
  const RecentFilesScreen({Key? key}) : super(key: key);

  @override
  State<RecentFilesScreen> createState() => _RecentFilesScreenState();
}

class _RecentFilesScreenState extends State<RecentFilesScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        title: Text("Recent Files"),
        titleTextStyle: boldTextStyle(fontSize: 24),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            splashRadius: 22,
            icon: Image.asset(
              search_image,
              height: 26,
              width: 26,
              color: mode.theme ? darkIconColor : iconColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16, right: 16, left: 16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: recentFilesList.length,
                primary: false,
                padding: EdgeInsets.only(bottom: 16),
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onLongPress: () {
                      selectedFilesList.add(recentFilesList[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: mode.theme ? darkPrimaryLightColor : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(recentFilesList[index].image.toString())),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recentFilesList[index].titleText.toString(),
                                  style: primaryTextStyle(),
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(height: 8),
                                if (recentFilesList[index].folderText!.isNotEmpty)
                                  Row(
                                    children: [
                                      Image.asset("assets/images/document.png", color: Colors.grey, height: 15, width: 15),
                                      SizedBox(width: 8),
                                      Text(" 0 files", style: secondaryTextStyle()),
                                    ],
                                  ),
                                SizedBox(height: 8),
                                Text("${recentFilesList[index].date}  ${recentFilesList[index].time}", style: secondaryTextStyle()),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              RecentFilesShareBottomSheetComponent(context, height);
                            },
                            child: Icon(
                              Icons.share_outlined,
                              color: mode.theme ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              if (recentFilesList[index].folderText!.isEmpty) {
                                RecentFilesMenuOptionsBottomSheet(context, height, width, index,
                                    cardTitleText: recentFilesList[index].titleText,
                                    date: recentFilesList[index].date,
                                    time: recentFilesList[index].time,
                                    cardImage: recentFilesList[index].image);
                              } else {
                                FolderBottomSheetComponent(context, height, width,
                                    cardImage: recentFilesList[index].image,
                                    time: recentFilesList[index].time,
                                    date: recentFilesList[index].date,
                                    fileText: recentFilesList[index].folderText,
                                    cardTitleText: recentFilesList[index].titleText,
                                    listIndex: index);
                              }
                            },
                            child: Icon(
                              Icons.more_vert,
                              color: mode.theme ? Colors.white : Colors.black,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
