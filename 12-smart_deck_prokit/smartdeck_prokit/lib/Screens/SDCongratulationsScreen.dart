import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smartdeck_prokit/SDUtils/SDStyle.dart';

import 'SDHomePageScreen.dart';

class SDCongratulationsScreen extends StatefulWidget {
  @override
  _SDCongratulationsScreenState createState() => _SDCongratulationsScreenState();
}

class _SDCongratulationsScreenState extends State<SDCongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(left: 26, right: 26),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('images/smartDeck/images/sdtrophy.png'), height: size.height * 0.18, fit: BoxFit.cover),
                SizedBox(height: 20),
                Text("Congratulations!", style: boldTextStyle(size: 20)),
                SizedBox(height: 16),
                Text("You have successfully completed the \ngeography module & certificate", textAlign: TextAlign.center, style: secondaryTextStyle()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: SDButton(
              textContent: "CLOSE",
              onPressed: () {
                SDHomePageScreen().launch(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
