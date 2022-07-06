import 'package:flutter/material.dart';
import 'colorThemes.dart';

enum IconType {
  tiny,
  small,
  medium,
  large,
  xLarge,
  xxLarge,
  xxxLarge,
}

IconTheme getIconTheme(icon, iconThemeData, color) {
  return IconTheme(
    data: iconThemeData.merge(IconThemeData(color: color)),
    child: Icon(icon),
  );
}

IconTheme getIcon(icon,
    {iconType = IconType.medium, color = ColorTheme.black}) {
  return getIconTheme(icon, iconType, color);
}
