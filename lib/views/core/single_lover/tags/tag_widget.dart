import 'dart:math';

import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    required this.color,
    required this.angle,
    required this.child,
  }) : super(key: key);


  final Color color;
  final double angle;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: child
    );
  }
}
