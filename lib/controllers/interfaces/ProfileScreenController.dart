// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';

abstract class ProfileScreenController {
  void initState();
  void onValidate();
  void onDropdownChanged(AvailabilityStatus? value);
  void onAvatarStatusPressed();
  void onAvatarPressed();

  GlobalKey<FormState> get formKey;
  TextEditingController get status;
  AvailabilityStatus get availability;
}
