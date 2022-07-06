import 'package:flutter/material.dart';
import 'package:supplier_drivers/domain/theme/colorThemes.dart';

enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
}

class FlavorValues {
  late String baseUrl;

  FlavorValues({required this.baseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color colorPrimary;
  final Color colorPrimaryDark;
  final Color colorPrimaryLight;
  final Color colorAccent;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color colorPrimary = ColorTheme.primaryColor,
    Color colorPrimaryDark = ColorTheme.primaryDarkColor,
    Color colorPrimaryLight = ColorTheme.primaryLightColor,
    Color colorAccent = ColorTheme.primaryLightColor,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      enumName(flavor.toString()),
      colorPrimary,
      colorPrimaryDark,
      colorPrimaryLight,
      colorAccent,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.colorPrimary,
    this.colorPrimaryDark,
    this.colorPrimaryLight,
    this.colorAccent,
    this.values,
  );

  static FlavorConfig? get instance {
    return _instance;
  }

  static String enumName(String enumToString) {
    var paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

  static bool isProduction() => _instance?.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEVELOPMENT;
}
