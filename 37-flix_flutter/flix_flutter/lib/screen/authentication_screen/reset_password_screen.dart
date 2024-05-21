import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/authentication_screen/startwith_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

import '../../model/startwith_model.dart';

class ResetPasswordScreen extends StatefulWidget {
  List<Map<String, dynamic>>? data;
  String? title;

  ResetPasswordScreen({this.data, this.title});

  State<ResetPasswordScreen> createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  int currentIndex = 0;
  List<StartwithModel> startWith = getStartWithList();

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  runSpacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'Reset Password',
                      style: boldTextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Select one of the following methods to reset your password',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                StartWithScreen(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Or contact',
                ),
                TextButton(
                  child: Text('support@movia.com'),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget StartWithComponent(StartwithModel element, int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: currentIndex != index
            ? Border.all(width: 2, color: Colors.grey.shade600)
            : Border.all(width: 0, color: Colors.transparent),
        color: currentIndex == index ? Colors.red : Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            element.leadingIcon,
            color: currentIndex == index ? Colors.white : Colors.white60,
            size: 22,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element.title!,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    element.subtitle!,
                    style: TextStyle(color: currentIndex == index ? Colors.white70 : Colors.white60, fontSize: 16),
                  ),
                ],
              ),
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
