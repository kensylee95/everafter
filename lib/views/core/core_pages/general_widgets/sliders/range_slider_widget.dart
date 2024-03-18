

import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderWidget extends StatelessWidget {
    const RangeSliderWidget({
      super.key,
      this.max,
      this.min,
      required this.ageRange,
      this.intervalValue,
      this.onChange,
    });
    final dynamic max;
    final dynamic min;
    final SfRangeValues ageRange;
    final double? intervalValue;
    final void Function(dynamic)? onChange;
    @override
    Widget build(BuildContext context) {
      return SfRangeSlider(
        max: max??60, //60.0,
        min: min??1, //1.0,
        values: ageRange, //controller.ageRange,
        inactiveColor: Colors.grey.shade300,
        edgeLabelPlacement: EdgeLabelPlacement.inside,
        labelPlacement: LabelPlacement.onTicks,
        activeColor: primaryColor1,
        interval: intervalValue, //5,
        onChanged: onChange, //(value) => controller.selectedAgeRange(value),
      );
    }
  }
  