import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;
}

class MyTheme {
  static final darkTheme = ThemeData(
    textTheme: TextTheme(titleMedium: TextStyle(color: Colors.white)),
    iconTheme: IconThemeData(
      color: Colors.grey,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    primarySwatch: Colors.blue,
    cardColor: Colors.white,
  );
}
