import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension Ext on BuildContext {
  ThemeData get theme => Theme.of(this);

  double get w => MediaQuery.of(this).size.width;

  double get h => MediaQuery.of(this).size.height;
}

extension Wiget on Widget {
  Widget paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }
}

void osSetStatusBarColor({required Color statusBarColor}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: statusBarColor), // status bar color
  );
}
