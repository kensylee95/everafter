
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: "Hi, ",
                style: Theme.of(context).textTheme.titleLarge,
                children: [
                  TextSpan(
                    text: "Steven ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
           FaIcon(FontAwesomeIcons.handsBubbles, size: 15, color: coreIconsColor.withAlpha(180),)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(FontAwesomeIcons.locationPinLock, color: coreIconsColor, size: 15,),
            const SizedBox(width: padding,),
            Text(
              "Life-Camp, Abuja",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        )
      ],
    );
  }
}