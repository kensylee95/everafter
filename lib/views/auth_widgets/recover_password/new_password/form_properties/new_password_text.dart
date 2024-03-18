
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/auth.dart';

class NewPassWordText extends StatelessWidget {
  const NewPassWordText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      newPassword,
      style: Theme.of(context).textTheme.displaySmall,
      textAlign: TextAlign.center,
    );
  }
}