// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/app/AppColors.dart';

enum AvailabilityStatus implements Comparable<AvailabilityStatus> {
  available(color: Colors.green, tag: 'Available'),
  away(color: Colors.yellow, tag: 'Away'),
  busy(color: Colors.red, tag: 'Busy'),
  inCall(color: AppColors.primaryColor, tag: 'In a Call');

  const AvailabilityStatus({
    required this.color,
    required this.tag,
  });

  final Color color;
  final String tag;

  @override
  int compareTo(AvailabilityStatus status) => tag == status.tag ? 0 : -1;
}
