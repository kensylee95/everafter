
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    required this.intervalValue,
    this.onChange,
  });

  final dynamic min;
  final dynamic max;
  final dynamic value;
  final double intervalValue;
  final void Function(dynamic)? onChange;

  @override
  Widget build(BuildContext context) {
    return SfSlider(
        max: max,
        min: min,
        value: value, //controller.maximumDistanceValue,
        inactiveColor: Colors.grey.shade300,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        labelPlacement: LabelPlacement.onTicks,
        activeColor: primaryColor1,
        interval: intervalValue, //5
        onChanged: onChange //(value) => controller.selectedMiles(value),
        );
  }
}