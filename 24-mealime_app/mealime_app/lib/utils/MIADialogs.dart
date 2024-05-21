import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import '../models/MIAMealModel.dart';

void displayDeleteDialog(BuildContext context, MIAMealModel element) {
  showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CustomTheme(
            child: CupertinoAlertDialog(
              title: Text(
                'Delete?',
                style: boldTextStyle(color: appStore.textPrimaryColor, size: 18),
              ),
              content: Text(
                'Are you sure want to delete this meal?',
                style: secondaryTextStyle(color: appStore.textPrimaryColor, size: 16),
              ),
              actions: [
                CupertinoDialogAction(
                  child: Text(
                    'Cancel',
                    style: primaryTextStyle(color: dodgerBlue, size: 18),
                  ),
                  onPressed: () {
                    finish(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text(
                    'Delete',
                    style: primaryTextStyle(color: redColor, size: 18),
                  ),
                  onPressed: () {
                    miaStore.removeMeal(header: element.header!, element: element, name: element.text);
                    finish(context);
                  },
                )
              ],
            ),
          ));
}

class CustomTheme extends StatelessWidget {
  final Widget? child;

  CustomTheme({required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: appStore.isDarkModeOn ? ThemeData.dark().copyWith(colorScheme: ColorScheme.dark(background: context.scaffoldBackgroundColor, brightness: Brightness.dark)) : ThemeData.light(),
      child: child!,
    );
  }
}
