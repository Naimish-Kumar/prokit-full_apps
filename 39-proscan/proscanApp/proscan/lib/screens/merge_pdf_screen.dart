import 'package:flutter/material.dart';
import 'package:proscan/component/AppButton.dart';
import 'package:proscan/models/dashboard_model_class.dart';
import 'package:proscan/utils/color.dart';

import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import 'account_screen.dart';

class MergePdfScreen extends StatelessWidget {
  MergePdfScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(elevation: 0, iconTheme: IconThemeData(color: mode.theme ? Colors.white : Colors.black)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 16, bottom: 100, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Merge PDF",
                  style: boldTextStyle(fontSize: 30),
                  // textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Text("2 Selected files to be merged", style: secondaryTextStyle(fontSize: 16)),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                TextFormFieldLabelText(text: "File Name", style: boldTextStyle()),
                TextFormField(
                  decoration: inputDecoration(hintText: "Enter file name"),
                ),
                SizedBox(height: 16),
                ListView.builder(
                    itemCount: 2,
                    primary: false,
                    padding: EdgeInsets.only(bottom: 16),
                    shrinkWrap: true,
                    itemBuilder: (context, int index) {
                      return Container(
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
                                image: DecorationImage(fit: BoxFit.fill, image: AssetImage(dashboardFilesList[index].image.toString())),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dashboardFilesList[index].titleText.toString(),
                                    style: boldTextStyle(),
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(height: 16),
                                  Text("${dashboardFilesList[index].date}  ${dashboardFilesList[index].time}",
                                      style: secondaryTextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.close))
                          ],
                        ),
                      );
                    }),
                AppButton(
                  text: "+ Add more files",
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RecentFilesScreen()));
                  },
                  color: mode.theme ? darkPrimaryColor : primaryLightColor,
                  textColor: mode.theme ? Colors.white : primaryColor,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: AppButton(
              text: "Merge",
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Files merged")));
              },
            ),
          ),
        ],
      ),
    );
  }
}
