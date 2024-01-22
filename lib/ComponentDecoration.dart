// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';

class ComponentDecoration {
  static InputDecoration inputDecoration({
    Widget? suffixIcon,
    String? label,
    String? hint,
  }) {
    return InputDecoration(
      suffixIconColor: AppColors.borderColor,
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      labelStyle: GoogleFonts.inter(color: AppColors.hintTextColor),
      labelText: label,
      hintStyle: GoogleFonts.inter(color: AppColors.hintTextColor),
      hintText: hint,
    );
  }
}
