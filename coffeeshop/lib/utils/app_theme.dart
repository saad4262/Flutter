import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.brown,
  scaffoldBackgroundColor: Colors.white,
  // Add more light theme styles here
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.brown,
  scaffoldBackgroundColor: Color(0xFF121212),
  // textTheme: const TextTheme(
  //   bodyLarge: TextStyle(color: Colors.white), // Default text color
  //   bodyMedium: TextStyle(color: Colors.grey),
  // ),
  // Add more dark theme styles here
);
