import 'package:flutter/material.dart';
import 'package:mealime_app/screens/MIASingleMealScreen.dart';
import 'package:mealime_app/utils/MIADataGenerator.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/MIAFavMealComponent.dart';
import '../models/MIAMealModel.dart';
import '../utils/MIAWidgets.dart';

class MIAFavFragment extends StatelessWidget {
  List<MIAMealModel> favList = getMealList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: miaFragmentAppBar(context, 'Favourites', false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 16,
              children: favList.map((e) {
                return MIAFavMealComponent(element: e).onTap(() {
                  MIASingleMealScreen(element: e).launch(context);
                });
              }).toList(),
            ).paddingSymmetric(horizontal: 8).center(),
            40.height,
          ],
        ),
      ),
    );
  }
}
