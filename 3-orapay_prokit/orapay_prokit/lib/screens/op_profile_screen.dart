import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:orapay_prokit/main.dart';
import 'package:orapay_prokit/model/OPModel.dart';
import 'package:orapay_prokit/utils/Colors.dart';
import 'package:orapay_prokit/utils/OPDataProvider.dart';

class op_ProfileScreen extends StatefulWidget {
  @override
  op_ProfileScreenState createState() => op_ProfileScreenState();
}

class op_ProfileScreenState extends State<op_ProfileScreen> {
  List<OPPickVerifyModel> settingItems = getSettingItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.separated(
            separatorBuilder: (_, index) => Divider(),
            padding: EdgeInsets.all(8),
            itemCount: settingItems.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              OPPickVerifyModel data = settingItems[index];

              return Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(data.icon, size: 20, color: opSecondaryColor.withOpacity(0.6)),
                    16.width,
                    Text(data.cardTitle!, style: primaryTextStyle()),
                  ],
                ),
              );
            },
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('images/ic_theme.png', height: 24, width: 24, color: opSecondaryColor.withOpacity(0.6)).paddingOnly(left: 6),
                  16.width,
                  Text('Dark Mode', style: primaryTextStyle()),
                ],
              ),
              Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  setState(() { });
                  appStore.toggleDarkMode(value: s);
                },
              )
            ],
          ).paddingSymmetric(horizontal: 8)
        ],
      ),
    );
  }
}
