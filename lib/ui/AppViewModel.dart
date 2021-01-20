import 'package:flutter/material.dart';
import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/services/ThemeService.dart';
import 'package:stacked/stacked.dart';

class AppViewModel extends ReactiveViewModel {
  ThemeService themeService = locator<ThemeService>();
  bool get isDarkMode => themeService.isDarkMode;
  ThemeData get lightTheme => themeService.lightTheme;
  ThemeData get darkTheme => themeService.darkTheme;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [themeService];
}
