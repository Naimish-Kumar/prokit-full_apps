import 'package:flutter/material.dart';
import 'package:proscan/component/AppButton.dart';
import 'package:proscan/screens/account_screen.dart';

import '../models/prefrance_screen_model.dart';
import '../utils/color.dart';
import '../utils/common.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Security", style: boldTextStyle(fontSize: 24)),
        iconTheme: IconThemeData(color: mode.theme ? Colors.white : Colors.black),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: securityScreenList.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16, right: 8, top: 16, bottom: 16),
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  //
                },
                child: Row(
                  children: [
                    Text(securityScreenList[index].title!, style: primaryTextStyle()),
                    Spacer(),
                    securityScreenList[index].isSwitch == true
                        ? Switch(
                            value: securityScreenList[index].isTapped!,
                            activeTrackColor: primaryColor,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(
                                () {
                                  securityScreenList[index].isTapped = value;
                                },
                              );
                            },
                          )
                        : IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward_ios, size: 20, color: mode.theme ? Colors.white : Colors.black),
                          ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppButton(
              text: "Change Password",
              color: mode.theme ? darkPrimaryColor : primaryLightColor,
              textColor: mode.theme ? Colors.white : primaryColor,
              onTap: () {
                //
              },
            ),
          )
        ],
      ),
    );
  }
}
