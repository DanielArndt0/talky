// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ContactPreviewModel {
  ContactPreviewModel({
    required this.title,
    this.status = '',
    this.avatar,
  });

  String title;
  String status;
  Widget? avatar;
}
