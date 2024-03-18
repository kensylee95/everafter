
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.firaSans(
              fontSize: 15, color: Theme.of(context).brightness==Brightness.dark? Colors.grey.shade100: Colors.grey.shade700, fontWeight: FontWeight.bold, letterSpacing: 0),
        ),
      ],
    );
  }
}
