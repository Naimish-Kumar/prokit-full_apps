import 'package:flutter/material.dart';
import 'package:music_flutter_app/app_theme.dart';
import 'package:music_flutter_app/screens/splash_screen.dart';
import 'package:music_flutter_app/store/app_store.dart';
import 'package:nb_utils/nb_utils.dart';

// APP STORE
AppStore appStore = AppStore();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  textPrimaryColorGlobal = Colors.white;

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
