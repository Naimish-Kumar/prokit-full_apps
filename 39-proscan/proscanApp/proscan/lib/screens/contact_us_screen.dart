import 'package:flutter/material.dart';
import 'package:proscan/utils/color.dart';
import 'package:proscan/utils/common.dart';
import 'package:proscan/utils/constant.dart';

import '../models/contact_us_screen_model.dart';
import 'account_screen.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        itemCount: contactUsList.length,
        itemBuilder: (Context, int index) {
          return GestureDetector(
            onTap: () {
              //
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
                border: Border.all(color: mode.theme ? Colors.white30 : Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(contactUsList[index].image!, color: primaryColor, height: 26),
                  SizedBox(width: 16),
                  Text(
                    contactUsList[index].title!,
                    style: primaryTextStyle(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
