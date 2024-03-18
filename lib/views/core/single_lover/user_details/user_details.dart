
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';
import 'package:remind_me/views/core/single_lover/user_details/lover_location_text.dart';
import 'package:remind_me/views/core/single_lover/user_details/minutes_away.dart';
import 'package:remind_me/views/core/single_lover/user_details/online_status.dart';
import 'package:remind_me/views/core/single_lover/user_details/user_bio.dart';

class UserDetails extends StatelessWidget{
  const UserDetails({
    super.key,
    required this.borderRadius,
    required this.isOnline,
    required this.minutesAway,
    required this.size,
  });

  final double borderRadius;
  final bool isOnline;
  final String minutesAway;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(borderRadius),
          //top: Radius.circular(borderRadius),
        ),
        child: BackdropFilter(
          blendMode: BlendMode.luminosity,
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 10.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: padding),
            width: size.width,
            height: size.height * 0.24,
            decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.3),
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(borderRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const UserBio(
                      fullName: "Kingsley Umenze",
                      age: 21,
                    ),
                    isOnline
                        ? const OnlineStatus()
                        : const SizedBox.shrink(),
                  ],
                ),
                MinutesAway(minutesAway: minutesAway),
                const SizedBox(
                  height: 5,
                ),
                const LoverLocationText(
                  location: "Life_camp abuja",
                ),
              ],
            ),
          ),
        ),
      );
  }
}
