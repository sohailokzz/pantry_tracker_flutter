import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.plusJakartaSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000),
    ),
    displayMedium: GoogleFonts.plusJakartaSans(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000),
    ),
    displaySmall: GoogleFonts.plusJakartaSans(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: const Color(0xff000000),
    ),
    titleLarge: GoogleFonts.plusJakartaSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.grey[700],
    ),
    titleMedium: GoogleFonts.plusJakartaSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey[700],
    ),
    titleSmall: GoogleFonts.plusJakartaSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF6B6A6A),
    ),
    bodyLarge: GoogleFonts.plusJakartaSans(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodyMedium: GoogleFonts.plusJakartaSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    bodySmall: GoogleFonts.plusJakartaSans(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  );
}
