import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/repository/interfaces/AvailabilityStatusRepository.dart';

class AvailabilityStatusRepositoryImpl extends AvailabilityStatusRepository {
  @override
  Widget style(AvailabilityStatus status) => Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: status.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            status.tag,
            style: GoogleFonts.inter(
              color: AppColors.primaryFontColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
}
