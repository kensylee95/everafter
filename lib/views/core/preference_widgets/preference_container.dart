
import 'package:flutter/material.dart';
import 'package:remind_me/constants/sizes.dart';

class PreferenceContainer extends StatelessWidget {
  const PreferenceContainer({
    super.key,
    required this.size,
    required this.children,
  });

  final Size size;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(surfaceTintColor: Colors.yellow.shade50,
      child: Container(
        padding: const EdgeInsets.all(padding),
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //boxShadow: [BoxShadow(blurRadius: 0.5, color: Colors.grey.shade600, blurStyle: BlurStyle.outer, spreadRadius: 0.5)],
            color:Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.black87,
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...children,
          ],
        ),
      ),
    );
  }
}