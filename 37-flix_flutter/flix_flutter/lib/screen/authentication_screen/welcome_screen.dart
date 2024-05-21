import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/dashboard_screens/dashboard_screen.dart';
import 'package:prokit_flutter/utils/common_widgets.dart';
import 'package:prokit_flutter/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  final title;

  WelcomeScreen({this.title});

  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            size: 28,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 8,
              children: [
                Image.asset(
                  CELEBRATION,
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width * 0.3,
                  colorBlendMode: BlendMode.screen,
                ),
                Text(
                  'Congratulations',
                  style: boldTextStyle(fontSize: 24),
                ),
                Text(
                  'Your ${widget.title!} has been verified\nyou can enjoy of Flix',
                  style: secondaryTextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                    (Route route) => false);
              },
              child: redirectionButtonContainer(title: 'Enter to Flix', width: MediaQuery.of(context).size.width - 32),
            )
          ],
        ),
      ),
    );
  }
}
