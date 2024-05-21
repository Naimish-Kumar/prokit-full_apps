import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proscan/screens/account_screen.dart';

import 'color.dart';

InputDecoration inputDecoration(
    {required String hintText,
    bool? filled,
    Widget? suffixIcon,
    Widget? prefixIcon,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    Color? fillColor,
    Color? focusColor}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: textSecondaryColor),
    border: border ?? UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    enabledBorder: enabledBorder ?? UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    disabledBorder: border ?? UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    focusedBorder: focusedBorder ?? UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
    errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    filled: filled,
    fillColor: fillColor,
    focusColor: primaryColor,
    counterText: "",
  );
}

TextStyle primaryTextStyle({double? fontSize, Color? color}) {
  if (mode.theme) {
    return TextStyle(fontSize: fontSize ?? 18, color: color ?? darkTextPrimaryColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 18, color: color ?? textPrimaryColor);
  }
}

TextStyle secondaryTextStyle({double? fontSize, Color? color}) {
  if (mode.theme) {
    return TextStyle(fontSize: fontSize ?? 14, color: color ?? darkTextSecondaryColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 14, color: color ?? textSecondaryColor);
  }
}

TextStyle boldTextStyle({double? fontSize, Color? color}) {
  if (mode.theme) {
    return TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color ?? darkTextBoldColor);
  } else {
    return TextStyle(fontSize: fontSize ?? 16, fontWeight: FontWeight.bold, color: color ?? textBoldColor);
  }
}

String? nameValidator(String value) {
  if (value.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return "Enter Name";
  } else {
    return null;
  }
}

// String? emailValidator(String value) {
//   if (value.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
//     return "Enter correct email";
//   } else {
//     return null;
//   }
// }

// String? passwordValidator(String value) {
//   if (value.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d).{8,}$').hasMatch(value)) {
//     return "Enter correct password";
//   } else {
//     return null;
//   }
// }

// String? phoneNumberValidator(String value) {
//   if (value.isEmpty || !RegExp(r'^\d+$').hasMatch(value)) {
//     return "Enter correct phone number";
//   } else {
//     return null;
//   }
// }
