// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {super.key, required this.avatar, required this.radius, this.color});

  final double radius;
  final Widget? avatar;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: avatar,
      ),
    );
  }
}
