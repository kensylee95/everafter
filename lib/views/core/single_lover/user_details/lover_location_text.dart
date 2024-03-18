
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoverLocationText extends StatelessWidget {
  const LoverLocationText({
    super.key, required this.location,
  });
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.locationDot,
          color: Colors.grey.shade300,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(location,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: Colors.white)),
      ],
    );
  }
}