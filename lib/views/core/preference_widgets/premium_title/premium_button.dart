import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({
    super.key,
    required this.size,
    required this.text,
    required this.onTap,
  });
  final Size size;
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width, //60,
        height: size.height, //30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [
                
                Color(0xffd2ac47),//.withAlpha(180),
                Color(0xfff7ef80),//.withAlpha(100),
                Color(0xffedc967),
              ],
            )),
        child: Card(
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold)
                  //?.apply(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
