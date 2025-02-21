import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFF2196F3);
final Color secondaryColor = Color(0xFFFF9800);
final Color backgroundColor = Color(0xFFF5F5F5);

final TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.roboto(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.roboto(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: primaryColor,
  onPrimary: Colors.white,
  textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
);

final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: secondaryColor,
  onPrimary: Colors.white,
  textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
);

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: primaryButtonStyle,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor), colorScheme: ColorScheme(background: backgroundColor),
);
