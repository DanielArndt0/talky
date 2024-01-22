// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.inter(
          color: AppColors.primaryFontColor,
          fontWeight: FontWeight.w700,
          fontSize: size,
        ),
        children: const [
          TextSpan(text: 'Talky'),
          TextSpan(text: '.', style: TextStyle(color: AppColors.primaryColor)),
        ],
      ),
    );
  }
}
