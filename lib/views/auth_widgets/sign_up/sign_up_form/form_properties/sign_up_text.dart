
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      signUp,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.center,
    );
  }
}