import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/constants/colors.dart';
class TTextTheme {
  //--- Light text Theme
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: defaultTextColor,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: defaultTextColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: defaultTextColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: defaultTextColor,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: defaultTextColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: defaultTextColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: defaultTextColor,
    ),
      titleMedium: GoogleFonts.courgette(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: defaultTextColor,
    ),
    titleSmall: GoogleFonts.amita(
      fontSize: 15.0,
      fontWeight: FontWeight.normal,
      color: defaultTextColor,
    ),
    labelSmall: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: defaultTextColor,
    ),
  );

  //-- Dark text theme
  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: darkTextColor,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkTextColor,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24.0,
      fontWeight: FontWeight.w700,
      color: darkTextColor,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: darkTextColor,
    ),
    titleLarge: GoogleFonts.content(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: darkTextColor,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: darkTextColor,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: darkTextColor,
    ),
     titleSmall: GoogleFonts.courgette(
      fontSize: 12,
      fontWeight: FontWeight.w100,
      color: defaultTextColor,
    ),
    titleMedium: GoogleFonts.courgette(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      color: darkTextColor,
    ), 
    labelSmall: GoogleFonts.roboto(
      fontSize: 25,
      fontWeight: FontWeight.w100,
      color: defaultTextColor,
    ),
  );
}
