
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MinutesAway extends StatelessWidget {
  const MinutesAway({
    super.key,
    required this.minutesAway,
  });

  final String minutesAway;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.solidClock,
          color: Colors.grey.shade300,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          minutesAway,
          style: GoogleFonts.alkatra(
              fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
