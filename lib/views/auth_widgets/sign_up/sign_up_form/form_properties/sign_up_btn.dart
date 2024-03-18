import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: size.width,
      height: 60,
      onTap: onTap,
      icon: Icons.create,
      text: signUp,
    );
  }
}
