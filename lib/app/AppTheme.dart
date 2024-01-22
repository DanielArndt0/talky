// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';

class AppTheme {
  static ThemeData standardTheme = ThemeData(
    fontFamily: 'Inter',
    textTheme: currentTextTheme,
    primaryColor: AppColors.primaryColor,
    primarySwatch: AppColors.primaryMaterialColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryMaterialColor,
    ),
    useMaterial3: true,
  );

  static TextTheme standardTextTheme = TextTheme(
    displayLarge: fontFamily(fontSize: 57),
    displayMedium: fontFamily(fontSize: 45),
    displaySmall: fontFamily(fontSize: 36),
    bodyLarge: fontFamily(fontSize: 16),
    labelLarge: fontFamily(fontSize: 14, fontWeight: FontWeight.w500),
    labelMedium: fontFamily(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: fontFamily(fontSize: 11, fontWeight: FontWeight.w500),
  );

  static TextStyle fontFamily({
    required double fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.inter(
      color: AppColors.primaryFontColor,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize,
    );
  }

  static ThemeData currentTheme = standardTheme;
  static TextTheme currentTextTheme = standardTextTheme;
}
