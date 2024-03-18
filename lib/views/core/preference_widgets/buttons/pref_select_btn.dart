
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PrefSelectBtn extends StatelessWidget {
  const PrefSelectBtn({
    super.key,
    required this.onTap,
    required this.text,
  });

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: TextButton(
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0),
              textAlign: TextAlign.center,
            ),
            FaIcon(
              FontAwesomeIcons.angleRight,
              color: Colors.grey.shade400,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
