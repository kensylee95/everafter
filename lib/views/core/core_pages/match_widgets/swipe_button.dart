import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.onTap,
    this.text,
    this.blur,
    this.width,
  });
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final VoidCallback onTap;
  final double? blur;
  final String? text;
  final double? width;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Card(
            elevation: 10,
            shape: CircleBorder(side: BorderSide(width: size.width * 0.18)),
            child: Container(
              width: width ?? size.width * 0.15,
              height: width ?? size.width * 0.15,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: blur ?? 60,
                      spreadRadius: 10,
                      color: iconColor.withOpacity(0.2))
                ],
                border: Border.all(width: 5, color: iconColor.withOpacity(0.1)),
                color: bgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                  child: FaIcon(
                icon,
                color: iconColor,
                size: 25,
              )),
            ),
          ),
          text != null
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    text!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(color: Colors.grey.shade600),
                  ))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
