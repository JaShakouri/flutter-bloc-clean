import 'package:flutter/material.dart';
import 'colorThemes.dart';

class IconThemes {
  final IconThemeData tiny;
  final IconThemeData small;
  final IconThemeData medium;
  final IconThemeData large;
  final IconThemeData xLarge;
  final IconThemeData xxLarge;
  final IconThemeData xxxLarge;

  IconThemes(
      {required this.tiny,
      required this.small,
      required this.medium,
      required this.large,
      required this.xLarge,
      required this.xxLarge,
      required this.xxxLarge});
}

class IconDataTheme {
  IconDataTheme._();
  static IconThemes iconThemes = IconThemes(
    tiny: _tiny,
    small: _small,
    medium: _medium,
    large: _large,
    xLarge: _xLarge,
    xxLarge: _xxLarge,
    xxxLarge: _xxxLarge,
  );
  static const IconThemeData _tiny = IconThemeData(
    color: ColorTheme.black,
    size: 16,
  );
  static const IconThemeData _small = IconThemeData(
    color: ColorTheme.black,
    size: 20,
  );
  static const IconThemeData _medium = IconThemeData(
    color: ColorTheme.black,
    size: 24,
  );
  static const IconThemeData _large = IconThemeData(
    color: ColorTheme.black,
    size: 28,
  );
  static const IconThemeData _xLarge = IconThemeData(
    color: ColorTheme.black,
    size: 32,
  );
  static const IconThemeData _xxLarge = IconThemeData(
    color: ColorTheme.black,
    size: 36,
  );
  static const IconThemeData _xxxLarge = IconThemeData(
    color: ColorTheme.black,
    size: 40,
  );
}
