import 'package:flutter/material.dart';
import 'fontThemes.dart';

import 'colorThemes.dart';

class AppTheme {
  AppTheme._();

  static const Color _iconColor = Colors.black;

  static const Color _lightBackgroundColor = Colors.white;
  static const Color _lightPrimaryColor = ColorTheme.primaryColor;
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.white;
  static const Color _lightOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    colorScheme: const ColorScheme.light(
        background: _lightBackgroundColor,
        primary: _lightPrimaryColor,
        primaryContainer: _lightPrimaryVariantColor,
        secondary: _lightSecondaryColor,
        onPrimary: _lightOnPrimaryColor),
    iconTheme: const IconThemeData(color: _iconColor),
    textTheme: FontThemeMobile.textTheme,
    primaryColor: _lightBackgroundColor,
    bottomAppBarColor: _lightPrimaryColor,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    colorScheme: const ColorScheme.light(
        background: ColorTheme.dark,
        primary: _lightPrimaryColor,
        primaryContainer: _lightPrimaryVariantColor,
        secondary: _lightSecondaryColor,
        onPrimary: _lightOnPrimaryColor),
    iconTheme: const IconThemeData(color: _iconColor),
    textTheme: FontThemeMobile.textTheme,
    primaryColor: _lightBackgroundColor,
    bottomAppBarColor: _lightPrimaryColor,
  );

}
