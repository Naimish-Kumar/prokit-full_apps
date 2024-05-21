import 'package:flutter/material.dart';
import 'package:proscan/component/text_form_field_label_text.dart';
import 'package:proscan/screens/account_screen.dart';

import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import 'AppButton.dart';

Future<dynamic> RenameBottomSheetComponent(BuildContext context, double height) {
  return showModalBottomSheet(
    backgroundColor: mode.theme ? darkPrimaryLightColor : Colors.white,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(DEFAULT_RADIUS)),
    ),
    elevation: 0,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
        child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Container(
                height: 2,
                width: 40,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
              ),
              SizedBox(height: 16),
              Text("Rename", style: boldTextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              TextFormFieldLabelText(text: "New Name"),
              TextFormField(
                decoration: inputDecoration(hintText: "Enter new name"),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      text: "Cancel",
                      color: mode.theme ? darkPrimaryColor : primaryLightColor,
                      textColor: mode.theme ? Colors.white : primaryColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: AppButton(
                      text: "Rename",
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your file renamed successfully")));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
