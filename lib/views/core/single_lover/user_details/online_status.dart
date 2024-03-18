
import 'package:flutter/material.dart';
import 'package:remind_me/constants/texts/match_maker_texts.dart';

class OnlineStatus extends StatelessWidget {
  const OnlineStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        onlineStatusText,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.apply(color: Colors.white),
      );
  }
}
