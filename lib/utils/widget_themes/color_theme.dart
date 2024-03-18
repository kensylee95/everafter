
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';

class ColorTheme {
  ColorTheme._();

  //-- Light Theme --

  static final lightbarckgroundTheme = ColorScheme(brightness: Brightness.light, primary: lightBackgroundColor, onPrimary: lightBackgroundColor, secondary: lightBackgroundColor.withAlpha(200), onSecondary: lightBackgroundColor, error: Colors.red, onError: Colors.white, background: lightBackgroundColor.withAlpha(200), onBackground: Colors.black, surface: lightBackgroundColor.withAlpha(220), onSurface: Colors.black);
  //-- Dark Theme --
  static final darkbackgroundTheme = ColorScheme(brightness: Brightness.dark, primary: darkBackgroundColor, onPrimary: darkBackgroundColor, secondary: darkBackgroundColor.withAlpha(200), onSecondary: darkBackgroundColor, error: Colors.red, onError: Colors.white, background: darkBackgroundColor.withAlpha(200), onBackground: Colors.white, surface: darkBackgroundColor.withAlpha(220), onSurface: Colors.white);
}