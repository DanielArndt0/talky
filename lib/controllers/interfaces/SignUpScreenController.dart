// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';

abstract class SignUpScreenController {
  void initState();
  void onUserValidation();
  void onSignUpButtonPressed();

  GlobalKey<FormState> get formKey;
  TextEditingController get name;
  TextEditingController get email;
  TextEditingController get password;
}
