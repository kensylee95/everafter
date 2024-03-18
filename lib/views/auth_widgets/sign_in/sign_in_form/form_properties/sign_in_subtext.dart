
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class SignInSubText extends StatelessWidget {
  const SignInSubText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      signInSubtitle,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}

