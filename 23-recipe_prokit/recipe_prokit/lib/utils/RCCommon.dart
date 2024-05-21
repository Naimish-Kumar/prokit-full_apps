import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:recipe_prokit/main.dart';
import 'package:recipe_prokit/utils/RCColors.dart';


Widget loginOptions(){
  return  Row(
    mainAxisAlignment : MainAxisAlignment.center,
    children: [
      Container(
        child: Image.asset('images/google_logo.png',height: 30,width: 30),
        decoration: BoxDecoration(
            border: Border.all(color: rcSecondaryTextColor),
            borderRadius: radius(16)
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
      Container(
        child: Image.asset('images/apple.png',height: 30,width: 30,color: appStore.isDarkModeOn ? Colors.white : Colors.black),
        decoration: BoxDecoration(
            border: Border.all(color: rcSecondaryTextColor),
            borderRadius: radius(16)
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),

      ),
      Container(
        child: Image.asset('images/ic_facebook.png',height: 30,width: 30),
        decoration: BoxDecoration(
            border: Border.all(color: rcSecondaryTextColor),
            borderRadius: radius(16)
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 16),
      ),
    ],
  );
}

Widget profileImage(String path,double h,double w){
  return  Image.asset(path,height: h,width: w,fit : BoxFit.cover).cornerRadiusWithClipRRect(12);
}