import 'package:mobx/mobx.dart';

part 'theme_mode.g.dart';

class theme = themeMode with _$theme;

abstract class themeMode with Store {
  @observable
  bool theme = false;

  @action
  void isDarkMode(bool isDark) {
    theme = !theme;
  }
}
