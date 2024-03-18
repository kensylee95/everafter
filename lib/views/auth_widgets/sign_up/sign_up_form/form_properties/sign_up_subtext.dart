
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class SignUpSubText extends StatelessWidget {
  const SignUpSubText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      signUpSubtitle,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}

