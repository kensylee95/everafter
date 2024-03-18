import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  //-- Light Theme --
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
                   style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: secondaryColor,
                      side: const BorderSide(color: secondaryColor),
                      padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
  );

  //-- Dark Theme --
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: secondaryColor,
                      side: const BorderSide(color: secondaryColor),
                      padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
  );
}