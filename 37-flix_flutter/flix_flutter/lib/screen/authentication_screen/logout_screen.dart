import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prokit_flutter/model/user_image_model.dart';
import 'package:prokit_flutter/screen/authentication_screen/sign_in_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';

class LogoutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LogoutScreenState();
  }
}

class LogoutScreenState extends State<LogoutScreen> {
  List<UserImageModel> userImage = getUserDetails();
  late UserImageModel user;

  void initState() {
    int indexforRandomComponent = Random().nextInt(userImage.length);
    user = userImage[indexforRandomComponent];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 64),
          Text(
            'Log Out',
            style: boldTextStyle(fontSize: 22),
          ),
          SizedBox(height: 32),
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.grey.shade600,
            child: CircleAvatar(
              radius: 72,
              backgroundImage: AssetImage(user.imageName!),
            ),
          ),
          SizedBox(height: 8),
          Text(
            user.username!,
            style: secondaryTextStyle(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            user.name!,
            style: boldTextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Are you sure you want to Logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Cancel',
                            style: primaryTextStyle(fontSize: 14),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => SignInScreen()), (route) => false);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.grey.shade800,
                                duration: Duration(milliseconds: 2000),
                                content: Text(
                                  "You've logged out!",
                                  style: secondaryTextStyle(),
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                            );
                          },
                          child: Text(
                            'Logout',
                            style: boldTextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  });
            },
            child: redirectionButtonContainer(title: 'Logout', color: Colors.red),
          )
        ],
      ),
    ));
  }
}
