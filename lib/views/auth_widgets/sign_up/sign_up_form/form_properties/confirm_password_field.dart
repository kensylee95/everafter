
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: null,
      obscureText: true,
      onTap: () {},
      hintText: password,
      prefixIcon:  Icons.password_rounded,
      suffixIcon: Icons.toggle_on_rounded,
      errorText: null,
    );
  }
}
