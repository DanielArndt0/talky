// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/app/AppColors.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final Widget? icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.5,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 15, 24.0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: _iconNullFlex(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon ?? Container(),
                    ],
                  ),
                ),
                Expanded(
                  flex: _iconNullFlex(2),
                  child: Text(
                    label,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: AppColors.primaryFontColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int _iconNullFlex(int flexValue) => icon == null ? 0 : flexValue;
}
