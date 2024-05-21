import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:cloudstorage_prokit/components/CSDisplayDataInListViewComponents.dart';
import 'package:cloudstorage_prokit/model/CSDataModel.dart';
import 'package:cloudstorage_prokit/utils/CSImages.dart';
import 'package:cloudstorage_prokit/main.dart';

class CSSharedScreen extends StatefulWidget {
  static String tag = '/CSSharedScreen';

  @override
  CSSharedScreenState createState() => CSSharedScreenState();
}

class CSSharedScreenState extends State<CSSharedScreen> {
  List<CSDataModel> onlySharedData() {
    List<CSDataModel> sharedData = [];
    getCloudboxList.forEach((element) {
      if (element.isShared) {
        sharedData.add(element);
      }
    });
    return sharedData;
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: onlySharedData().length != 0
            ? CSDisplayDataInListViewComponents(
                listOfData: onlySharedData(),
                isSelect: false,
                isSelectAll: false,
                selectedItem: 0,
                isCopyOrMove: false,
                onListChanged: () {
                  setState(() {});
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(CSOfflineImg, height: 120, width: 120),
                    Text("Aim for the shared", style: boldTextStyle(size: 20)).paddingOnly(top: 20, bottom: 10),
                    Wrap(
                      children: [
                        Text(
                          "After you share an item, it'll show up here, so it's easier to get to",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ).paddingSymmetric(vertical: 10, horizontal: 50),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}