
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/toggle_switch.dart';

class AgeRangeToggle extends StatelessWidget {
  const AgeRangeToggle({
    super.key,
    required this.controller,
    required this.size,
    required this.listOfIcons,
  });

  final PreferenceController controller;
  final Size size;
  final List<Icon> listOfIcons;

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ToggleSwitchButton(
                size: size,
                initialIndex: controller.initialAgeRangeIndex.value,
                onTap: (index) {
                  controller.toggledAgeRange(index!);
                },
                listOflabels: const ["NO", "YES"],
                listOfIcons: listOfIcons),
    );
  }
}
