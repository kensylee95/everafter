
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/controllers/matching/preferences_controller.dart';
import 'package:remind_me/views/core/core_pages/general_widgets/toggle_switch.dart';

class HasBio extends StatelessWidget {
  const HasBio({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final PreferenceController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Has a bio",
          style: GoogleFonts.poppins(
              fontSize: 15,
              //fontWeight: FontWeight.bold,
              letterSpacing: 0),
        ),
        ToggleSwitchButton(
            listOfIcons: const [
              Icon(
                Icons.dangerous,
                color: Colors.white,
                size: 13,
              ),
              Icon(
                Icons.verified,
                color: Colors.white,
                size: 13,
              )
            ],
            size: Size(size.width, (size.width * 0.5) / 3),
            listOflabels: const ["NO", "YES"],
            onTap: (value) => controller.userMustHaveBio(value!),
            initialIndex: controller.hasBioInitialIndex),
      ],
    );
  }
}
