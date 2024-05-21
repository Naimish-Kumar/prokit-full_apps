import 'package:coinpro_prokit/screen/CPSplashScreen.dart';
import 'package:coinpro_prokit/store/AppStore.dart';
import 'package:coinpro_prokit/utils/AppTheme.dart';
import 'package:coinpro_prokit/utils/CPDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync('isDarkModeOnPref'));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '${"Coin Pro"}${!isMobile ? ' ${platformName()}' : ''}',
        home: CPSplashScreen(),
        theme: appStore.isDarkModeOn ? AppThemeData.darkTheme:AppThemeData.lightTheme ,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
