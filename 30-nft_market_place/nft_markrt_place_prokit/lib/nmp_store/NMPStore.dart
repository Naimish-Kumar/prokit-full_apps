import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'store.g.dart';

class ThemeStore = ThemeStoreBase with _$ThemeStore;

abstract class ThemeStoreBase with Store {
  @observable
  bool isDarkMode = false;

  @action
  void setDarkMode(bool value) {
    isDarkMode = value;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: isDarkMode ? Colors.black : Colors.white), // status bar color
    );
  }
}
