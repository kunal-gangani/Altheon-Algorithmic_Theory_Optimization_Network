import 'package:algorithmic_thory_optimization_network/core/theme/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,

    textTheme: GoogleFonts.orbitronTextTheme(ThemeData.dark().textTheme),

    colorScheme: const ColorScheme.dark(primary: AppColors.cyan),
  );
}
