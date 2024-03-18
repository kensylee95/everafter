import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:remind_me/constants/sizes.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
    required this.child,
    this.loadingText,
  }) : super(key: key);
  final Widget child;
  final String? loadingText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness==Brightness.light?Colors.grey.shade50:Colors.grey.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
            const SizedBox(
              height: padding,
            ),
            Text(
              loadingText ?? "Loading...",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.apply(color: primaryColor1),
            )
          ],
        ),
      ),
    );
  }
}
