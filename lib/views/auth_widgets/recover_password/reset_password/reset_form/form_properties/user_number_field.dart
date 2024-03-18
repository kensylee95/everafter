
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_textfield.dart';

class UserNumberField extends StatelessWidget {
  const UserNumberField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
    CustomTextfield(
      controller: null,
      obscureText: false,
      onTap: () {},
      hintText: email,
      prefixIcon:  Icons.email_outlined,
      errorText: null,
    );
  }
}
