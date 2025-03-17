// ignore_for_file: implementation_imports, file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky_chat/Errors/AuthException.dart';
import 'package:talky_chat/controllers/AuthControllerImpl.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/controllers/interfaces/SignUpScreenController.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/FirebaseAuthService.dart';
import 'package:talky_chat/services/FirestoreDBService.dart';
import 'package:talky_chat/services/interfaces/AuthService.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';

class SignUpScreenControllerImpl extends SignUpScreenController {
  final BuildContext context;
  final NavigatorController navigatorController;
  final CurrentUserProvider currentUser;
  final AuthService authService; // TODO authService
  final CloudDBService CDBService; // TODO CDBService
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpScreenControllerImpl({
    required this.context,
    required this.navigatorController,
    required this.currentUser,
    required this.authService,
    required this.CDBService,
  });

  final AuthControllerImpl authController = AuthControllerImpl(
    authService: FirebaseAuthService.instance,
    cloudDBService: FirestoreDBService(currentUser: CurrentUserProvider()),
    currentUser: CurrentUserProvider(),
  ); // TODO remove

  bool get _state => _formKey.currentState!.validate();

  @override
  void initState() {}

  @override
  // TODO: Retornar esta future
  Future<void> onUserValidation() async {
    if (_state) {
      try {
        await authController.register(
          email: _emailController.text,
          password: _passwordController.text,
          name: _nameController.text,
        );
        navigatorController.goToProfile();
      } on AuthException catch (e) {
        navigatorController.showSnackbar(e.message);
      } catch (e) {
        navigatorController.showSnackbar(e.toString());
      }

      // auth().then((credential) {
      //   register(credential)
      //       .then((value) => navigatorController.goToProfile())
      //       .onError((error, stackTrace) {
      //     _showError(error);
      //   });
      // }).onError((error, stackTrace) {
      //   _showError(error);
      // });
    }
  }

  @override
  void onSignUpButtonPressed() => navigatorController.goToSignIn();

  @override
  TextEditingController get name => _nameController;

  @override
  TextEditingController get email => _emailController;

  @override
  TextEditingController get password => _passwordController;

  @override
  GlobalKey<FormState> get formKey => _formKey;

  void _showError(Object? error) {
    error as FirebaseAuthException;
    navigatorController.showSnackbar(error.message!);
  }
}
