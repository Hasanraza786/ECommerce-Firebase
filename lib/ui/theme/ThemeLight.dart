import 'package:flutter/material.dart';
import 'AppColors.dart';

class LightTheme {
  ThemeData getTheme() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColors.primarySwatch,
        // change scaffold background color according to your need
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          // change app bar color according to you need
          color: Colors.transparent,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Change text font sizes and color according to your need
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyText2: TextStyle(fontSize: 12),
        ),
      );
}
