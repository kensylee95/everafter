import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';

class DistanceText extends StatelessWidget {
  const DistanceText({
    super.key,
    required this.controller,
  });

  final PreferenceController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Text(
          "${controller.distanceFilter.value} ${controller.distanceUnit}.",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.apply(color: Colors.grey.shade500)),
    );
  }
}
