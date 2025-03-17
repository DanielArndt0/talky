import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky_chat/Errors/AuthException.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/controllers/interfaces/SignInSocialScreenController.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/interfaces/AuthService.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';

class SignInSocialScreenControllerImpl extends SignInSocialScreenController {
  final BuildContext context;
  final NavigatorController navigatorController;
  final CurrentUserProvider currentUser;
  final AuthService authService; // TODO authService
  final CloudDBService CDBService; // TODO CDBService
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignInSocialScreenControllerImpl({
    required this.context,
    required this.navigatorController,
    required this.currentUser,
    required this.authService,
    required this.CDBService,
  });

  bool get _state => _formKey.currentState!.validate();

  @override
  void initState() {}

  @override
  // TODO: Retornar esta future
  Future<void> onUserValidation() async {
    if (_state) {
      try {
        final UserCredential userCredential = await authService.signInUser(
          email: _emailController.text,
          password: _passwordController.text,
        );

        currentUser.updateUserCredential(userCredential);
        await CDBService.refreshUser();

        if (currentUser.localUser.isNewUser) {
          navigatorController.goToProfile();
        } else {
          navigatorController.goToChats();
        }
      } catch (e) {
        e as AuthException;
        navigatorController.showSnackbar(e.message);
      }
    }
  }

  @override
  void onSignUpButtonPressed() => navigatorController.goToSignUp();

  @override
  void onForgotPasswordButtonPressed() {}

  @override
  TextEditingController get email => _emailController;

  @override
  TextEditingController get password => _passwordController;

  @override
  GlobalKey<FormState> get formKey => _formKey;
}
