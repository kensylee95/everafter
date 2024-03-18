import 'package:flutter/material.dart';

import 'package:remind_me/constants/texts/auth.dart';
import 'package:remind_me/views/common_widgets/custom_button.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        width: size.width,
        height: 60,
        onTap: () {},
        icon: Icons.arrow_forward_rounded,
        text: resetPassword);
  }
}
