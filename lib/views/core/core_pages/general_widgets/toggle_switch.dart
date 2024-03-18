
import 'package:flutter/material.dart';
import 'package:remind_me/constants/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitchButton extends StatelessWidget {
  const ToggleSwitchButton({
    super.key,
    required this.size,
    this.listOflabels,
    this.listOfIcons,
    required this.onTap,
    required this.initialIndex, this.totalSwitch,
  });

  final Size size;
  final List<String>? listOflabels;
  final List<Icon?>? listOfIcons;
  final void Function(int?)? onTap;
  final int initialIndex;
  final int? totalSwitch;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: size.width * 0.2,
      minHeight: 25,
      fontSize: 5,
      dividerColor: Colors.white,
      initialLabelIndex: initialIndex,
      activeBgColors:List.generate(totalSwitch??2, (index) => [primaryColor1]),
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey.shade800,
      borderColor: List.generate(totalSwitch??2, (index) => Colors.grey.shade300),
      inactiveFgColor: Colors.white,
      totalSwitches: totalSwitch??2,
      animate: true,
      changeOnTap: true,
      labels: listOflabels, //const ["No", "Yes"],
      customIcons: listOfIcons, //
      customTextStyles: [
        Theme.of(context).textTheme.bodySmall?.apply(color: Colors.white)
      ],
      onToggle: onTap,
    );
  }
}