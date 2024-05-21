import 'package:flutter/material.dart';
import 'package:proscan/component/AppButton.dart';
import 'package:proscan/screens/account_screen.dart';
import 'package:proscan/utils/color.dart';

import '../component/text_form_field_label_text.dart';
import '../utils/common.dart';

class TabBarWatermarkTextScreen extends StatelessWidget {
  const TabBarWatermarkTextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mode.theme ? darkPrimaryLightColor : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          TextFormFieldLabelText(text: "Your Text"),
          TextFormField(
            decoration: inputDecoration(hintText: "Enter your text"),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  text: "Cancel",
                  onTap: () {
                    Navigator.pop(context);
                  },
                  color: mode.theme ? darkPrimaryColor : primaryLightColor,
                  textColor: mode.theme ? Colors.white : primaryColor,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: AppButton(
                    text: "Continue",
                    color: primaryColor,
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Watermark is added")));
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
