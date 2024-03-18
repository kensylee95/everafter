import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';


class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  //-- Light Theme --
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
                     style: ElevatedButton.styleFrom(
                      elevation: 0,
                      disabledBackgroundColor: Colors.grey.shade500,
                      disabledForegroundColor: Colors.grey.shade600,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      foregroundColor: primaryColor,
                      backgroundColor: primaryColor1,
                      side: BorderSide(color: primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
  );

  //-- Dark Theme --
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
                      elevation: 0,
                       disabledBackgroundColor: Colors.grey.shade500,
                      disabledForegroundColor: Colors.grey.shade600,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      foregroundColor: primaryColor,
                      backgroundColor: primaryColor1,
                      side: BorderSide(color: primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
  );
}