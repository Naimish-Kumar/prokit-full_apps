// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$theme on themeMode, Store {
  late final _$themeAtom = Atom(name: 'themeMode.theme', context: context);

  @override
  bool get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(bool value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$themeModeActionController =
      ActionController(name: 'themeMode', context: context);

  @override
  void isDarkMode(bool isDark) {
    final _$actionInfo =
        _$themeModeActionController.startAction(name: 'themeMode.isDarkMode');
    try {
      return super.isDarkMode(isDark);
    } finally {
      _$themeModeActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme}
    ''';
  }
}
