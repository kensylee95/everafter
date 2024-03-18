import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final double width;
  final double height;
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.apply(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
