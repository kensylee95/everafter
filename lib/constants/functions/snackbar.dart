import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

SnackbarController snackBar({
  required String title,
  required String message,
  required BuildContext context,
}) {
  final snackTextColor = Theme.of(context).brightness == Brightness.dark
      ? Colors.white
      : Colors.black;
  final snackBgColor = Theme.of(context).brightness == Brightness.dark
      ? Colors.black
      : Colors.white;
      final snackBorderColor = Theme.of(context).brightness == Brightness.dark
      ? Colors.grey.shade500
      : Colors.grey.shade200;
  return Get.snackbar(
    title,
    "",
    backgroundColor: snackBgColor,
    colorText: snackTextColor,
    messageText: Text(
      message,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    animationDuration: const Duration(
      milliseconds: 800,
    ),
    borderRadius: padding,
    borderWidth: 3.0,
    margin: const EdgeInsets.symmetric(horizontal: padding, vertical: padding),
    duration: const Duration(milliseconds: 4000),
    borderColor: snackBorderColor,
    icon: const Icon(
      Icons.verified,
      color: primaryColor1,
    ),
  );
}
