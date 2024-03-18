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
    this.textField, this.validator,
  });
  final TextEditingController? textField;
  final String? errorText;
  final bool visiblePassword;
  final VoidCallback toggleVisiblePassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: textField,
      validator: validator,
      obscureText: !visiblePassword,
      onTap: toggleVisiblePassword,
      hintText: password,
      prefixIcon: Icons.fingerprint,
      suffixIconColor: !visiblePassword?primaryColor1:Colors.green,
      suffixIcon: visiblePassword?Icons.toggle_on_rounded:Icons.toggle_off_rounded,
      errorText: errorText,
    );
  }
}
