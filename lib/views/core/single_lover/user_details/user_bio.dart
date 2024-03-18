

import 'package:flutter/material.dart';

class UserBio extends StatelessWidget {
  const UserBio({
    super.key, required this.fullName, required this.age,
  });
  final String fullName;
  final int age;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
              text: fullName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Colors.white)),
                  
          const TextSpan(text: ", "),
          TextSpan(
            text: age.toString(),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(color: Colors.white),
          ),
          const TextSpan(text: " "),
          WidgetSpan(
            child: Icon(
              Icons.verified,
              color: Colors.blue.shade100,
              size: 16,
            ),
          )
        ],
      ),
    );
  }
}
