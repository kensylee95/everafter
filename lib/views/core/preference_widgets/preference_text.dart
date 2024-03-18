
import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/constants/texts/preference.dart';

class PreferenceText extends StatelessWidget {
  const PreferenceText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Text(
        preferenceUses,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.apply(color: Colors.grey.shade500),
      ),
    );
  }
}