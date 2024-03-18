
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/texts/auth.dart';

class SignInText extends StatelessWidget {
  const SignInText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      signIn,
      style: Theme.of(context).textTheme.displaySmall?.apply(color: primaryColor1),
      textAlign: TextAlign.center,
    );
  }
}