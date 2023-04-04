import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppFont {

  static final mo11w400 = GoogleFonts.montserrat(
    fontSize: 11,
    color: Colors.white,
  );

  static final mo14w500 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final mo14w400 = GoogleFonts.montserrat(
    fontSize: 14,
    color: Colors.white,
  );

  static final mo16w400 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final mo16w600 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final be26w400 = GoogleFonts.bebasNeue(
    fontSize: 26,
    color: Colors.white,
  );
}
