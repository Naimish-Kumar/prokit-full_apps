import 'package:flutter/material.dart';
import 'package:mealime_app/utils/MIAColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MIAUpgradeScreen extends StatefulWidget {
  @override
  State<MIAUpgradeScreen> createState() => _MIAUpgradeScreenState();
}

class _MIAUpgradeScreenState extends State<MIAUpgradeScreen> {
  @override
  void initState() {
    setStatusBarColor(miaPrimaryColor);
    super.initState();
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.scaffoldBackground!);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.width(),
              color: miaPrimaryColor,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Image.asset('images/x.png', height: 20).onTap(() {
                    finish(context);
                  }),
                  16.height,
                  Text('Unlock Exclusive Recipes', style: boldTextStyle(size: 26)).center(),
                  16.height,
                  Row(
                    children: [
                      20.width,
                      Icon(Icons.check_circle, color: miaSecondaryColor),
                      Text('Access new recipes every month reserved for pro subscribers.', style: boldTextStyle(color: miaSecondaryColor), textAlign: TextAlign.center).expand(),
                    ],
                  ),
                  16.height,
                  Image.asset('images/best-seller.png', color: white, height: 250).center(),
                  16.height,
                ],
              ),
            ),
            Text('\$ 2.99 a month. Cancel anytime.', style: boldTextStyle()).paddingAll(16),
            AppButton(
              width: context.width() - 32,
              color: miaPrimaryColor,
              text: 'Upgrade to pro',
              textStyle: boldTextStyle(color: white),
              onTap: () {
                //
              },
            ).paddingSymmetric(horizontal: 16),
            Text('Restore to purchase', style: primaryTextStyle(color: miaPrimaryColor)).paddingAll(16)
          ],
        ),
      ),
    );
  }
}
