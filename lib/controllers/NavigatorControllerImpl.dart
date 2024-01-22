// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/NamedRoutes.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/enums/LoginType.dart';
import 'package:talky_chat/services/interfaces/NavigatorService.dart';

class NavigatorControllerImpl extends NavigatorController {
  NavigatorControllerImpl({
    required this.navigatorService,
  });

  final NavigatorService navigatorService;

  @override
  void go<T>({required String route, T? args}) =>
      navigatorService.navigateTo<T>(route, args);

  @override
  void goAndPop<T>({required String route, T? args}) =>
      navigatorService.navigateToAndRemove<T>(route, args);

  @override
  void goToSignInEnter(LoginType loginType) => go<LoginType>(
        route: NamedRoutes.signInEnter,
        args: loginType,
      );

  @override
  void goToSignUp() => go(route: NamedRoutes.signUp);

  @override
  void goToProfile() => goAndPop(route: NamedRoutes.profile);

  @override
  void goToSignIn() => goAndPop(route: NamedRoutes.signIn);

  @override
  void goToChats() => goAndPop(route: NamedRoutes.chats);

  @override
  void goToChat() {
    // TODO: implement goToChat
  }

  @override
  void showSnackbar(String message) =>
      ScaffoldMessenger.of(navigatorService.context!)
          .showSnackBar(SnackBar(content: Text(message)));
}
