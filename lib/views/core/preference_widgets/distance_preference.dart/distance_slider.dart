
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/sliders/slider_widget.dart';

class DistanceSlider extends StatelessWidget {
  const DistanceSlider({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final PreferenceController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: size.width,
      child: Obx(
        ()=>SliderWidget(
                value: controller.distanceFilter.value,
                intervalValue: 5,
                min: 1,
                max: 100,
                onChange: (value) => controller.selectedMiles(value),
              ),
      ),
    );
  }
}