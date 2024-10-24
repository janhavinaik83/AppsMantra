import 'package:flutter/material.dart';

class AppThemes {
  // Light theme gradient
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 0, 55, 110),
    shadowColor: Colors.black.withOpacity(0.2),
    scaffoldBackgroundColor: Colors.transparent, // Set to transparent for gradient
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Color.fromARGB(255, 150, 144, 144)),
    ),
    
  );

  // Dark theme gradient
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 66, 181, 226) ,
    shadowColor: const Color(0xff1E1E1E).withOpacity(0.8),
    scaffoldBackgroundColor: Colors.transparent, // Set to transparent for gradient
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1E1E1E),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Color.fromARGB(255, 80, 76, 76)),
    ),
  );

  static const lightGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.4, 0.9],
      colors: [Color(0xFFFFFFFF),Color.fromARGB(255, 189, 225, 233)],
      tileMode: TileMode.clamp,
    );

    static const darkGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.4, 0.9],
      colors: [Color.fromARGB(255, 0, 0, 0), Color.fromARGB(255, 2, 36, 44)],
      tileMode: TileMode.clamp,
    );

    static const lightCard = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.9],
      colors: [Color.fromARGB(255, 186, 206, 207), // Soft mint
    Color.fromARGB(255, 200, 215, 224),],
      tileMode: TileMode.clamp,
    );

    static const darkCard = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 0.9],
      colors: [Color.fromARGB(255, 41, 59, 68), // Deep dark grey
    Color.fromARGB(255, 20, 35, 51),],
      tileMode: TileMode.clamp,
    );
}

// Color.fromARGB(255, 2, 36, 44)