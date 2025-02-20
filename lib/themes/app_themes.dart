import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff0b1014),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

}

extension ThemeExt on ThemeData {
  Color get customBackground => brightness == Brightness.dark ? Colors.black : Colors.white;
  Color get customText => brightness == Brightness.dark ? Colors.white : Colors.black;
  Color get customButtonBGColor => brightness == Brightness.dark ? Colors.deepPurple : Colors.cyan;

}