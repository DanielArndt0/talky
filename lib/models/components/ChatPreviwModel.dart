// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChatPreviewModel {
  ChatPreviewModel({
    required this.title,
    required this.message,
    this.avatar,
    this.time,
  });

  String title;
  String message;
  Widget? avatar;
  String? time;
}
