import 'package:flutter/material.dart';
import 'package:mealime_app/screens/MIASignInScreen.dart';
import 'package:mealime_app/screens/MIAWalkThroughScreen.dart';
import 'package:mealime_app/utils/MIAColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MIAWelcomeScreen extends StatelessWidget {
  const MIAWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Align(
            alignment: Alignment.center,
            child: Image.asset('images/mealime.png', height: 150),
          ),
          Column(
            children: [
              AppButton(
                color: miaPrimaryColor,
                text: 'Get Started',
                textStyle: boldTextStyle(color: white),
                onTap: () {
                  WalkThroughModelScreen().launch(context);
                },
              ),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member?  ', style: secondaryTextStyle(size: 16, color: miaSecondaryTextColor)),
                  Text('Sign In', style: boldTextStyle(decoration: TextDecoration.underline, color: miaSecondaryColor)).onTap(() {
                    MIASignInScreen().launch(context);
                  })
                ],
              )
            ],
          ),
        ],
      ).paddingAll(20),
    );
  }
}
