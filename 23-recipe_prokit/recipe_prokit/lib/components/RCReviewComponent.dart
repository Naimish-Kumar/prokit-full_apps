import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:recipe_prokit/models/RCReviewModel.dart';
import 'package:recipe_prokit/screens/RCSingleReviewScreen.dart';
import 'package:recipe_prokit/utils/RCColors.dart';
import 'package:recipe_prokit/utils/RCCommon.dart';


class RCReviewComponent extends StatelessWidget {
  const RCReviewComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing : 8,
      children: [
        profileImage('images/recipe/sandwich.jpg',70,context.width() / 4 - 16),
        profileImage('images/recipe/panCake.jpg',70,context.width() / 4 - 16),
        profileImage('images/recipe/pizza.jpg',70,context.width() / 4 - 16),
        Stack(
          children :[
            profileImage('images/recipe/coffee.jpg',70,context.width() / 4 - 16),
            Container(
              height : 70,
              width : context.width() / 4 - 16,
              decoration : BoxDecoration(borderRadius : radius(12),color : Colors.black.withOpacity(0.5)),
              child : Text('+471',style : primaryTextStyle(color : Colors.white)).center()
            ),
          ]
        )
      ],
    ).center();
  }
}

class RCReviewComponentOne extends StatelessWidget {

  List<RCReviewModel> reviewList = getReviews();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviewList.map((e) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  profileImage(e.profile,40,40),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(e.name,style: boldTextStyle()),
                      HorizontalList(
                        padding: EdgeInsets.all(0),
                        spacing: 1,
                          runSpacing: 0,
                          itemCount: 5,
                          itemBuilder: (context,index){
                            if (index == 4) {
                              return Icon(LineIcons.star_1, color: rcSecondaryColor, size: 10);
                            }
                            return Icon(
                              LineIcons.star_1,
                              color: primaryColor,
                              size: 10,
                            );
                          },
                      )
                    ],
                  ).expand(),
                  Row(
                    children: [
                      Icon(LineIcons.clock,color: rcSecondaryTextColor),
                      4.width,
                      Text('${e.time} ago', style: secondaryTextStyle(color: rcSecondaryTextColor)),
                    ],
                  ),
                ],
              ),
              16.height,
              Image.asset(e.foodImage,height: 200,width: context.width() - 32,fit: BoxFit.cover).cornerRadiusWithClipRRect(20),
              16.height,
              Divider()
            ],
          ),
        ).onTap((){
          RCSingleReviewScreen(element: e).launch(context);
        },splashColor: Colors.transparent,highlightColor: Colors.transparent);
      }).toList()
    );
  }
}

