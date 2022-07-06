import 'package:flutter/material.dart';
import 'colorThemes.dart';
import 'fontThemes.dart';

enum FontType {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  caption,
  button,
  overLine
}

TextTheme getFontTheme() {
  return FontThemeMobile.textTheme;
}

TextStyle getFontStyle(fontType, {color = ColorTheme.black}) {
  switch (fontType) {
    case FontType.headline1:
      return getFontTheme()
          .headline1!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.headline2:
      return getFontTheme()
          .headline2!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.headline3:
      return getFontTheme()
          .headline3!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.headline4:
      return getFontTheme()
          .headline4!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.headline5:
      return getFontTheme()
          .headline5!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.headline6:
      return getFontTheme()
          .headline6!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.subtitle1:
      return getFontTheme()
          .subtitle1!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.subtitle2:
      return getFontTheme()
          .subtitle2!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.bodyText1:
      return getFontTheme()
          .bodyText1!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.bodyText2:
      return getFontTheme()
          .bodyText2!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.button:
      return getFontTheme()
          .button!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.caption:
      return getFontTheme()
          .caption!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    case FontType.overLine:
      return getFontTheme()
          .overline!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
    default:
      return getFontTheme()
          .bodyText2!
          .merge(TextStyle(color: color, decoration: TextDecoration.none));
  }
}
