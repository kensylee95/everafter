import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/sliders/range_slider_widget.dart';

class AgeRangeSlider extends StatelessWidget {
  const AgeRangeSlider({
    super.key,
    required this.size,
    required this.controller,
    this.onChange,
  });

  final Size size;
  final PreferenceController controller;
  final void Function(dynamic)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: size.width,
      child: Obx(
        () => RangeSliderWidget(
                max: 100,
                min: 18,
                ageRange: controller.ageRange.value,
                intervalValue: 1,
                onChange: onChange,
              ),
      ),
    );
  }
}
