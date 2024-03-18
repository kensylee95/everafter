import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.errorText,
    required this.visiblePassword,
    required this.toggleVisiblePassword,
    required this.textField,
  });
  final TextEditingController textField;
  final String? errorText;
  final bool visiblePassword;
  final VoidCallback toggleVisiblePassword;

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: textField,
      obscureText: visiblePassword,
      onTap: () => toggleVisiblePassword,
      hintText: password,
      prefixIcon: Icons.fingerprint_outlined,
      suffixIconColor: visiblePassword?Colors.green:primaryColor1,
      suffixIcon: visiblePassword?Icons.toggle_on_rounded:Icons.toggle_off_rounded,
      errorText: errorText,
    );
  }
}
