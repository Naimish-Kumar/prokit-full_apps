//region imports
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mealime_app/models/MIAMealModel.dart';
import 'package:mealime_app/screens/MIASplashScreen.dart';
import 'package:mealime_app/store/AppStore.dart';
import 'package:mealime_app/store/MIAStore.dart';
import 'package:mealime_app/utils/AppTheme.dart';
import 'package:mealime_app/utils/MIAConstants.dart';
import 'package:mealime_app/utils/MIADataGenerator.dart';
import 'package:nb_utils/nb_utils.dart';

AppStore appStore = AppStore();

MIAStore miaStore = MIAStore();

List<MIAMealModel> mealMostPopularList = getMealList();
List<MIAMealModel> mealRecentlyCreatedList = getMealList();
List<MIAMealModel> mealTopRatedList = getMealList();
List<MIAMealModel> mealQuickEasyList = getMealList();

int currentIndex = 0;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList());

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '$appName${!isMobile ? ' ${platformName()}' : ''}',
        home: MIASplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
        supportedLocales: LanguageDataModel.languageLocales(),
        localeResolutionCallback: (locale, supportedLocales) => locale,
      ),
    );
  }
}
