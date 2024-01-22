// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/app/AppColors.dart';

class BlueButton extends ElevatedButton {
  BlueButton({
    super.key,
    required super.onPressed,
    required String label,
  }) : super(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        );
}
