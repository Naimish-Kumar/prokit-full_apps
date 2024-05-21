import 'package:flutter/material.dart';

import '../main.dart';

const DEFAULT_RADIUS = 10.0;
final RegExp emailValidate = RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]');

InputDecoration inputDecoration(BuildContext context, {String? hintText, String? labelText, Widget? suffixIcon}) {
  return InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(DEFAULT_RADIUS)),
    labelText: labelText ?? '',
    labelStyle: TextStyle(color: appStore.isDarkMode ? Colors.white : Colors.black),
    suffixIcon: suffixIcon,
  );
}
