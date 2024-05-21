import 'package:ev_spot_flutter/components/my_theme_component.dart';
import 'package:ev_spot_flutter/screens/splash_screen.dart';
import 'package:ev_spot_flutter/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppStore appStore = AppStore();
SharedPreferences? prefs;

late String darkMapStyle;
late String lightMapStyle;

void main() async {
  /// It is used to initialized the app before the use of widgets.
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));

  prefs = await SharedPreferences.getInstance();
  appStore.changeTheme(prefs!.getBool('themeStatus') ?? false);

  darkMapStyle = await rootBundle.loadString('assets/mapStyles/dark.json');
  lightMapStyle = await rootBundle.loadString('assets/mapStyles/light.json');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: MyTheme.lightTheme,
          themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: MyTheme.darkTheme,
          home: SplashScreen(),
        );
      },
    );
  }
}
