import 'package:ev_spot_flutter/main.dart';
import 'package:ev_spot_flutter/utils/colors.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  bool isDarkMode = false;

  @action
  Future<void> changeTheme(bool _isDarkMode, {bool isInitiliaze = false}) async {
    isDarkMode = _isDarkMode;
    if (isInitiliaze) prefs?.setBool('themeStatus', _isDarkMode);

    if (isDarkMode) {
      textThemePrimaryColor = textPrimaryDarkColor;
      textBoldColor = textBoldDarkColor;
      textSecondaryColor = textSecondaryDarkColor;
    } else {
      textThemePrimaryColor = textPrimaryLightColor;
      textBoldColor = textBoldLightColor;
      textSecondaryColor = textSecondaryLightColor;
    }
  }
}
