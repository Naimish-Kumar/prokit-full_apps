import 'package:flutter/material.dart';
import 'package:prokit_flutter/model/startwith_model.dart';
import 'package:prokit_flutter/screen/authentication_screen/signup_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

class StartWithScreen extends StatefulWidget {
  State<StartWithScreen> createState() => StartWithScreenState();
}

class StartWithScreenState extends State<StartWithScreen> {
  int currentIndex = 0;
  List<StartwithModel> startWith = getStartWithList();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: List.generate(startWith.length, (index) {
        return GestureDetector(
          onTap: () {
            currentIndex = index;
            setState(() {});
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen(
                    title: startWith[index].title,
                    isEmail: index == 1,
                  );
                },
              ),
            );
          },
          child: StartWithComponent(startWith[index], index),
        );
      }),
    );
  }

  Widget StartWithComponent(StartwithModel element, int index) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: currentIndex != index
            ? Border.all(width: 2, color: Colors.grey.shade600)
            : Border.all(width: 0, color: Colors.transparent),
        color: currentIndex == index ? Colors.red : Colors.transparent,
      ),
      child: Row(
        children: [
          Icon(
            element.leadingIcon,
            color: currentIndex == index ? Colors.white : Colors.white60,
            size: 22,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  element.title!,
                  style: boldTextStyle(color: currentIndex == index ? Colors.white : Colors.white70),
                ),
                SizedBox(height: 4),
                Text(
                  element.subtitle!,
                  style: secondaryTextStyle(
                    fontSize: 14,
                    color: currentIndex == index ? Colors.white70 : Colors.white60,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: currentIndex == index ? Colors.white70 : Colors.white60,
            size: 16,
          ),
        ],
      ),
    );
  }
}
