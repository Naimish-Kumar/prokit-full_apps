import 'package:banking_prokit/main.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:banking_prokit/utils/BankingColors.dart';
import 'package:banking_prokit/utils/BankingStrings.dart';
import 'package:banking_prokit/utils/BankingWidget.dart';

class BankingChangePassword extends StatefulWidget {
  @override
  _BankingChangePasswordState createState() => _BankingChangePasswordState();
}

class _BankingChangePasswordState extends State<BankingChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Text(
        Banking_lbl_app_Name.toUpperCase(),
        textAlign: TextAlign.center,
        style: primaryTextStyle(color: Banking_TextColorSecondary),
      ).paddingBottom(16),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.chevron_left,
                        size: 25,
                        color: appStore.isDarkModeOn ? white : Banking_blackColor,
                      ).onTap(
                        () {
                          finish(context);
                        },
                      ),
                      20.height,
                      Text('Change\nPassword', style: boldTextStyle(size: 32)),
                    ],
                  ),
                  20.height,
                  EditText(text: 'Old Password', isPassword: true, isSecure: true),
                  16.height,
                  EditText(text: 'New Password', isPassword: true, isSecure: true),
                  16.height,
                  40.height,
                  BankingButton(
                    textContent: Banking_lbl_Confirm,
                    onPressed: () {
                      toasty(context, 'Password Successfully Changed');
                      finish(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
