import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../models/MIAIngredientModel.dart';
import '../models/MIASelectOptionsModel.dart';
import '../utils/MIAColors.dart';
import '../utils/MIADataGenerator.dart';

Widget cookwareTab() {
  List<MIASelectOptionsModel> cookwareList = getCookwareList();

  return SingleChildScrollView(
    child: Column(
      children: cookwareList.map((e) {
        return Column(children: [
          ListTile(title: Text(e.title, style: boldTextStyle())),
          Divider(),
        ]);
      }).toList(),
    ),
  );
}

Widget ingredientsTab() {
  List<MIASelectOptionsModel> ingredientList = getIngredientsList();

  return SingleChildScrollView(
    child: Column(
      children: ingredientList.map((e) {
        return Column(children: [
          ListTile(
            title: Text(e.title, style: boldTextStyle()),
            trailing: Text(e.subtitle!),
          ),
          Divider()
        ]);
      }).toList(),
    ),
  );
}

Widget instructionsTab() {
  List<MIAInstructionsModel> instructions = getInstructions();

  return SingleChildScrollView(
    child: Column(
      children: instructions.map((e) {
        int index = instructions.indexOf(e) + 1;
        return Column(
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(index.toString(), style: boldTextStyle(color: miaSecondaryTextColor, size: 30)),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.title, style: boldTextStyle()),
                    8.height,
                    ...List.generate(e.subtitles.length, (index) => Text(e.subtitles[index], style: secondaryTextStyle())),
                  ],
                ).expand()
              ],
            ),
            16.height,
            Divider(),
          ],
        );
      }).toList(),
    ).paddingSymmetric(horizontal: 16),
  );
}
