import 'package:flutter/material.dart';

abstract class SignInSocialScreenController {
  void initState();
  Future<void> onUserValidation();
  void onSignUpButtonPressed();
  void onForgotPasswordButtonPressed();

  GlobalKey<FormState> get formKey;
  TextEditingController get email;
  TextEditingController get password;
}
