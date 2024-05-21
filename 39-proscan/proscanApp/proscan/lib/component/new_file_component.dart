import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proscan/component/text_form_field_label_text.dart';

import '../models/dashboard_model_class.dart';
import '../screens/account_screen.dart';
import '../utils/color.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import 'AppButton.dart';

Future<dynamic> NewFileBottomSheet({required BuildContext context, required File scannedImage}) {
  final _key = GlobalKey<FormState>();
  TextEditingController fileName = TextEditingController();
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: mode.theme ? darkPrimaryLightColor : Colors.white,
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
              Text("New File", style: boldTextStyle(fontSize: 24)),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              TextFormFieldLabelText(text: "File Name"),
              Form(
                key: _key,
                child: TextFormField(
                  controller: fileName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: inputDecoration(hintText: "Enter File name"),
                  validator: (value) {
                    return nameValidator(value!);
                  },
                ),
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
                      text: "Create",
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          Navigator.pop(context);
                          dashboardFilesList.insert(
                              0,
                              DashboardList(scannedImage.path, fileName.text, DateFormat("MM/dd/yy").format(DateTime.now()),
                                  DateFormat("HH:mm").format(DateTime.now()), ""));
                          fileName.text.replaceAll(fileName.text, "");
                          print("--------------------------${fileName.text}");
                          print("-------------------------  ${fileName.text.replaceAll(fileName.text, "")}");
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your file Created successfully")));
                        }
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
