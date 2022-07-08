import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  backgroundColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w300,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: Colors.black, size: 30),
    backgroundColor: Colors.white,
    centerTitle: true,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    disabledColor: Colors.grey,
  ),
  //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
);

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
    ),
    backgroundColor: Colors.black,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.yellow,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.yellow,
  ),
  primaryColor: Colors.amber,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.amber,
    disabledColor: Colors.grey,
  ),
  //colorScheme: ColorSchem   e.fromSwatch().copyWith(secondary: Colors.red),
);
