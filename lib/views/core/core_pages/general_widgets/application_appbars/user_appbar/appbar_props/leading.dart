
import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';

class Leading extends StatelessWidget {
  const Leading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: padding, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(padding)),
      ),
    );
  }
}
