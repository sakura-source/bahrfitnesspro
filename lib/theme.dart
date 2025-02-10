import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = Color(0xFF2196F3);
final Color secondaryColor = Color(0xFFFF9800);
final Color backgroundColor = Color(0xFFF5F5F5);

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.roboto(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.roboto(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.roboto(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.roboto(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.roboto(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  primary: primaryColor,
  onPrimary: Colors.white,
  textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
);

final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  primary: secondaryColor,
  onPrimary: Colors.white,
  textStyle: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
);

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  accentColor: secondaryColor,
  backgroundColor: backgroundColor,
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: primaryButtonStyle,
  ),
);
