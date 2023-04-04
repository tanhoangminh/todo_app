import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    required this.placeHolder,
    this.onChanged,
    this.controller,
    this.maxLines,
    this.suffixIcon,
    this.autoFocus = false,
  }) : super(key: key);
  final String placeHolder;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      controller: controller,
      style: GoogleFonts.montserrat(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      cursorHeight: 20,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 16,
          color: Colors.white.withOpacity(0.5),
          height: 1.2,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
