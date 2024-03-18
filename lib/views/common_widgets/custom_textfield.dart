import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remind_me/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.onTap,
    this.controller,
    this.suffixIconColor,
    this.validator,
    this.initialValue,
  });
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final bool obscureText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColor1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      initialValue: initialValue,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: onTap,
                  child: Icon(
                    suffixIcon,
                    size: 40,
                    color: suffixIconColor,
                  ),
                ),
              ),
        hintText: hintText,
        hintStyle:
            GoogleFonts.montserrat(fontSize: 15, color: Colors.grey.shade500),
        errorText: errorText,
        errorStyle:
            GoogleFonts.monda(fontSize: 12, fontWeight: FontWeight.w800),
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                color: primaryColor1,
              ),
      ),
      obscureText: obscureText,
      cursorOpacityAnimates: true,
      enableSuggestions: true,
      onTapOutside: null,
    );
  }
}
