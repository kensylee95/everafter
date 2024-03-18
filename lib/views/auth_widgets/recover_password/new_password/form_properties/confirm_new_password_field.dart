
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class ConfirmNewPasswordField extends StatelessWidget {
  const ConfirmNewPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: null,
      obscureText: true,
      onTap: () {},
      hintText: confirmNewPassword,
      prefixIcon: Icons.password_rounded,
      suffixIcon: Icons.toggle_on_rounded,
      errorText: null,
    );
  }
}
