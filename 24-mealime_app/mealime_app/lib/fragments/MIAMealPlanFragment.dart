import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mealime_app/components/MIAFavMealComponent.dart';
import 'package:mealime_app/main.dart';
import 'package:mealime_app/screens/MIASingleMealScreen.dart';
import 'package:mealime_app/utils/MIADialogs.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/MIABuildMealScreen.dart';
import '../utils/MIAColors.dart';
import '../utils/MIAWidgets.dart';

class MIAMealPlanFragment extends StatefulWidget {
  const MIAMealPlanFragment({Key? key}) : super(key: key);

  @override
  State<MIAMealPlanFragment> createState() => _MIAMealPlanFragmentState();
}

class _MIAMealPlanFragmentState extends State<MIAMealPlanFragment> {
  PreferredSizeWidget getAppBar() {
    if (miaStore.addedMeals.isEmpty) {
      return AppBar(leading: SizedBox(), elevation: 0);
    } else {
      return miaFragmentAppBar(context, 'Your personalized meal plan', true);
    }
  }

  @override
  void initState() {
    changeStatusColor(appStore.scaffoldBackground!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: getAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              miaStore.addedMeals.isEmpty
                  ? Column(
                      children: [
                        100.height,
                        Text('Your personalized meal plan', style: boldTextStyle(size: 24)),
                        14.height,
                        Text(
                          'Plan your meals for the entire week in minutes. Build your first meal plan to get started!',
                          style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor),
                        ),
                        20.height,
                        AppButton(
                          width: context.width() - 32,
                          color: miaPrimaryColor,
                          text: 'Build Your First Meal Plan',
                          textStyle: boldTextStyle(color: white),
                          onTap: () {
                            MIABuildMealScreen().launch(context);
                          },
                        ),
                      ],
                    )
                  : Offstage(),
              miaStore.addedMeals.isEmpty
                  ? Offstage()
                  : Wrap(
                      spacing: 8,
                      runSpacing: 16,
                      children: miaStore.addedMeals.map((e) {
                        return GestureDetector(
                          onTap: () {
                            MIASingleMealScreen(element: e);
                          },
                          onLongPress: () {
                            displayDeleteDialog(context, e);
                          },
                          child: MIAFavMealComponent(element: e),
                        );
                      }).toList(),
                    )
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      ),
    );
  }
}
