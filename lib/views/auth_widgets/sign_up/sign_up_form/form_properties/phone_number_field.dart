import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.textField,
    this.errorText,
    this.validator,
  });
  final TextEditingController? textField;
  final String? errorText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      validator: validator,
      controller: textField,
      obscureText: false,
      hintText: email,
      prefixIcon: Icons.email_outlined,
      errorText: errorText,
    );
  }
}
