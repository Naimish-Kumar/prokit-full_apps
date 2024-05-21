import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:scribblr/screens/splash_screen.dart';
import 'package:scribblr/screens/walkthrough_screen.dart';
import 'package:scribblr/store/app_store.dart';
import 'package:scribblr/utils/colors.dart';

import 'utils/app_theme.dart';

AppStore appStore = AppStore();

void main() {
  runApp(
    Provider<AppStore>(
      create: (_) => AppStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      return true;
    } else {
      await prefs.setBool('seen', true);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: appStore.isDarkMode ? scaffoldDarkColor : scaffoldPrimaryLight,
      statusBarIconBrightness: appStore.isDarkMode ? Brightness.light : Brightness.dark,
    ));
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Scribblr',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: FutureBuilder<bool>(
          future: checkFirstSeen(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (snapshot.data == true) {
                return SplashScreen();
              } else {
                return WalkthroughScreen();
              }
            }
          },
        ),
      ),
    );
  }
}
