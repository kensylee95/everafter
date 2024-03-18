import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/core/preference_widgets/premium_title/premium_button.dart';

class PremiumTitle extends StatelessWidget {
  const PremiumTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Premium Discovery",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              letterSpacing: 0,
              wordSpacing: 0),
        ),
        const SizedBox(
          width: padding,
        ),
        Expanded(
          child: PremiumButton(
              onTap: () {}, size: const Size(60, 30), text: "Go Premium"),
        )
      ],
    );
  }
}
