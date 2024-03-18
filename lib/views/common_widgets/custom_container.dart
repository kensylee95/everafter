import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.height,
    this.width,
    this.containerPadding,
    this.borderRadius,
    required this.child,
  }) : super(key: key);
  final double? height;
  final double? width;
  final EdgeInsets? containerPadding;
  final BorderRadius? borderRadius;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade900,
          borderRadius:borderRadius,
          ),
      width: width,
      height: height,
      child: child,
    );
  }
}
