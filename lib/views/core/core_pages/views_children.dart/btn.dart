


import 'package:flutter/material.dart';
import 'package:remind_me/views/core/core_pages/match_widgets/swipe_button.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SwipeButton(
      width: 40,
      icon: icon,
      iconColor: iconColor,
      onTap: onTap,
      bgColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade100
          : iconColor.withOpacity(0.1),
    );
  }
}