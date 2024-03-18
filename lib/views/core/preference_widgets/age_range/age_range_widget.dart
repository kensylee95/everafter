import 'package:flutter/material.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/preference_widgets/age_range/age_range_slider.dart';
import 'package:remind_me/views/core/preference_widgets/age_range/age_range_text.dart';
import 'package:remind_me/views/core/preference_widgets/age_range/age_range_toggle.dart';
import 'package:remind_me/views/core/preference_widgets/preference_container.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/preference_text_widget.dart';

class AgeRangeWidget extends StatelessWidget {
  const AgeRangeWidget({
    super.key,
    required this.size,
    required this.controller,
    required this.listOfIcons,
  });

  final Size size;
  final PreferenceController controller;
  final List<Icon> listOfIcons;

  @override
  Widget build(BuildContext context) {
    return PreferenceContainer(
      size: Size(size.width, size.height * 0.25),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const PreferenceTextWidget(text: "Age Range",),
            AgeRangeText(controller: controller),
          ],
        ),
        AgeRangeSlider(
          size: size,
          controller: controller,
          onChange: (value) => controller.selectedAgeRange(value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Only show people in\nthis age range",
                style: Theme.of(context).textTheme.bodySmall),
            AgeRangeToggle(
                controller: controller, size: size, listOfIcons: listOfIcons)
          ],
        )
      ],
    );
  }
}
