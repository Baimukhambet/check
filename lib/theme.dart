import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.montserrat(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w600),
      // TextStyle(
      //     color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
      titleLarge: GoogleFonts.montserrat(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      // TextStyle(
      //     color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),

      //MEAL NAME / INFO
      titleMedium: GoogleFonts.montserrat(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
      // TextStyle(
      //     color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),

      //MEAL PRICE
      titleSmall: const TextStyle(
          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),

      //CHECKOUT BUTTON
      headlineLarge: GoogleFonts.montserrat(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
    ));
