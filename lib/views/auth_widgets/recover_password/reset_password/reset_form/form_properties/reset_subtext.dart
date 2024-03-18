
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class ResetSubText extends StatelessWidget {
  const ResetSubText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      resetSubtitle,
      style: Theme.of(context).textTheme.bodySmall,
      textAlign: TextAlign.center,
    );
  }
}

