import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:eCommerce/ui/App.dart';
import 'package:eCommerce/app/locator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  setupLocator();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
  Firebase.initializeApp();
}
