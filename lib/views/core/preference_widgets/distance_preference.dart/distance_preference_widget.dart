
import 'package:flutter/material.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/preference_widgets/distance_preference.dart/distance_slider.dart';
import 'package:remind_me/views/core/preference_widgets/distance_preference.dart/distance_text.dart';
import 'package:remind_me/views/core/preference_widgets/distance_preference.dart/distance_toggle.dart';
import 'package:remind_me/views/core/preference_widgets/preference_container.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/preference_text_widget.dart';

class DistancePreference extends StatelessWidget {
  const DistancePreference({
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
            const PreferenceTextWidget(text: "Maximum Distance"),
            DistanceText(controller: controller),
          ],
        ),

        //
        DistanceSlider(size: size, controller: controller),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Only show people\naround this distance",
                style: Theme.of(context).textTheme.bodySmall),
            DistanceToggle(controller: controller, size: size, listOfIcons: listOfIcons)
          ],
        )
      ],
    );
  }
}
