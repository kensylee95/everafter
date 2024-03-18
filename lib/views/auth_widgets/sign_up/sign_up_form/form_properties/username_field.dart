
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: null,
      obscureText: false,
      onTap: () {},
      hintText: username,
      prefixIcon:  Icons.person,
      errorText: null,
    );
  }
}
