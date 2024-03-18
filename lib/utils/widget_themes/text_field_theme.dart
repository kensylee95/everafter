import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(
        width: 5,
        style: BorderStyle.solid,
        color: secondaryColor.withOpacity(0.1),
      ),
      borderRadius: BorderRadius.circular(15)
      ),
    border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(15),
      borderSide:BorderSide(
        width: 6.0,
        style: BorderStyle.solid,
        color: secondaryColor.withOpacity(0.1),
      ),
    ),
    labelStyle: const TextStyle(
      color: secondaryColor,
    ),
    hintStyle: const TextStyle(color: hintColor),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 4.0,
        color: secondaryColor.withOpacity(0.5),
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        width: 6.0,
        color: lightBackgroundColor,
      ),
    ),
    hintStyle: const TextStyle(color: hintColor),
    labelStyle: TextStyle(color: primaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 6.0,
        color: primaryColor,
      ),
    ),
  );
}
