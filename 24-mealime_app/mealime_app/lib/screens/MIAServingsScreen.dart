import 'package:flutter/material.dart';
import 'package:mealime_app/main.dart';
import 'package:mealime_app/models/MIASelectOptionsModel.dart';
import 'package:mealime_app/screens/MIASetReminderScreen.dart';
import 'package:mealime_app/utils/MIAColors.dart';
import 'package:mealime_app/utils/MIAConstants.dart';
import 'package:mealime_app/utils/MIADataGenerator.dart';
import 'package:mealime_app/utils/MIAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class MIAServingsScreen extends StatefulWidget {
  const MIAServingsScreen({Key? key}) : super(key: key);

  @override
  _MIAServingsScreenState createState() => _MIAServingsScreenState();
}

class _MIAServingsScreenState extends State<MIAServingsScreen> {
  List<MIASelectOptionsModel> servingList = [];
  int selectedIndex = 0;

  @override
  void initState() {
    servingList = getServingsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('How many Servings per meal?', style: boldTextStyle(size: 30)),
              20.height,
              Column(
                  children: servingList.map((e) {
                int index = servingList.indexOf(e);
                return Container(
                  width: context.width() - 32,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? miaContainerColor
                          : appStore.isDarkModeOn
                              ? context.cardColor
                              : miaContainerSecondaryColor,
                      borderRadius: radius(miaDefaultRadius)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.title,
                          style: boldTextStyle(
                              color: appStore.isDarkModeOn
                                  ? selectedIndex == index
                                      ? Colors.black
                                      : Colors.white
                                  : Colors.black)),
                      6.height,
                      Text(e.subtitle!,
                          style: secondaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? selectedIndex == index
                                      ? Colors.black
                                      : Colors.white
                                  : Colors.black)),
                    ],
                  ),
                ).onTap(() {
                  selectedIndex = index;
                  e.selected = !e.selected!;
                  setState(() {});
                });
              }).toList())
            ],
          ),
          AppButton(
            color: miaPrimaryColor,
            text: 'Continue',
            textStyle: boldTextStyle(color: white),
            onTap: () {
              MIASetReminderScreen().launch(context);
            },
          ).center().paddingBottom(20),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }
}
