import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
  static BorderRadius borderRadiusMed = BorderRadius.circular(8);
  static BorderRadius borderRadiusSmall = BorderRadius.circular(4);
  static BorderRadius borderRadiusLarge = BorderRadius.circular(16);
}
