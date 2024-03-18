
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class NewPasswordSubText extends StatelessWidget {
  const NewPasswordSubText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      newPasswordSubtitle,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}

