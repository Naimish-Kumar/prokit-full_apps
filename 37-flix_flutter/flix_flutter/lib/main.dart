import 'package:flutter/material.dart';
import 'package:prokit_flutter/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flix',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        // useMaterial3: true,
        primaryColor: Colors.white,
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
        iconTheme: IconThemeData(
          color: Colors.white60,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          iconColor: Colors.white60,
          hintStyle: TextStyle(color: Colors.white60),
          prefixIconColor: Colors.white60,
          suffixIconColor: Colors.white60,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(6),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: MaterialStatePropertyAll(EdgeInsets.all(2)),
                iconSize: MaterialStatePropertyAll(16),
                alignment: Alignment.center,
                visualDensity: VisualDensity.compact)),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(color: Colors.white),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.red,
          showSelectedLabels: true,
          unselectedItemColor: Colors.white60,
        ),
        navigationBarTheme: NavigationBarThemeData(height: 60, indicatorColor: Colors.transparent),

        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.red,
            iconSize: 14,
            focusElevation: 6,
            disabledElevation: 4,
            elevation: 8,
            splashColor: Colors.transparent,
            smallSizeConstraints: BoxConstraints.tight(const Size.fromRadius(14))),
      ),
      home: SplashScreen(),
    );
  }
}
