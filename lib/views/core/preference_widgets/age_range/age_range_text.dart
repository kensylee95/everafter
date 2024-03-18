
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';

class AgeRangeText extends StatelessWidget {
  const AgeRangeText({
    super.key,
    required this.controller,
  });

  final PreferenceController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>Text(
                "${controller.ageRange.value.start.toString().split(".")[0]} - ${controller.ageRange.value.end.toString().split(".")[0]}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.apply(color: Colors.grey.shade500)),
    );
  }
}
