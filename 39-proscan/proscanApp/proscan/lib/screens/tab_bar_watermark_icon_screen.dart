import 'package:flutter/material.dart';

import '../component/text_form_field_label_text.dart';
import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';

class TabBarWatermarkIconScreen extends StatelessWidget {
  const TabBarWatermarkIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 16),
        TextFormFieldLabelText(text: "Your Icon"),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 48),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(DEFAULT_RADIUS),
          ),
          child: Text("Select Icon", style: primaryTextStyle(color: Colors.white), textAlign: TextAlign.center),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }
}
