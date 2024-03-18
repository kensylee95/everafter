import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class FirstnameField extends StatelessWidget {
  const FirstnameField({
    super.key,
    required this.textField,
    this.errorText,
    this.validator,
  });
  final TextEditingController textField;
  final String? errorText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: textField,
      obscureText: false,
      onTap: () {},
      hintText: username,
      prefixIcon: Icons.person,
      errorText: errorText,
      validator: validator,
    );
  }
}
