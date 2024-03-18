
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remind_me/constants/sizes.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Center(
        child: Stack(
          children: [
            FaIcon(FontAwesomeIcons.bell, color: Colors.grey.shade500,),
            Positioned(
              left: 1,
              top: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(100)),
                
              ),
            )
          ],
        ),
      ),
    );
  }
}

