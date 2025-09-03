import 'package:flutter/material.dart';
import 'color.dart';

// الثيم العربي الفاتح
ThemeData themearabic = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.blue.shade50,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Appcolor.black),
    displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Appcolor.black),
    bodyLarge: TextStyle(height: 2, fontSize: 17, color: Appcolor.grey, fontWeight: FontWeight.bold),
  ),
  appBarTheme: AppBarTheme(color: Appcolor.primarycolor, centerTitle: true),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(backgroundColor: Appcolor.primarycolor),
  fontFamily: "cairo",
);

// الثيم العربي الداكن
ThemeData themearabicDark = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Appcolor.colorbackground,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(height: 2, fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),
  ),
  appBarTheme:  AppBarTheme(color: Appcolor.primarycolor, centerTitle: true),
  floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Appcolor.primarycolor),
  fontFamily: "cairo",
);

// الثيم الإنجليزي الفاتح
ThemeData themeEnglish = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.blue.shade50,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Appcolor.black),
    displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Appcolor.black),
    bodyLarge: TextStyle(height: 2, fontSize: 17, color: Appcolor.grey, fontWeight: FontWeight.bold),
  ),
  appBarTheme:  AppBarTheme(color: Appcolor.primarycolor, centerTitle: true),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(backgroundColor: Appcolor.primarycolor),
  fontFamily: "PlayfairDisplay",
);

// الثيم الإنجليزي الداكن
ThemeData themeEnglishDark = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Appcolor.colorbackground,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(height: 2, fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),
  ),
  appBarTheme:  AppBarTheme(color: Appcolor.primarycolor, centerTitle: true),
  floatingActionButtonTheme:  FloatingActionButtonThemeData(backgroundColor: Appcolor.primarycolor),
  fontFamily: "PlayfairDisplay",
);
