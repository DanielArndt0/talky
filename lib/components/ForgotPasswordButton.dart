// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/app/AppColors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: AppColors.primaryFontColor,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
