// ignore_for_file: file_names

import 'package:talky_chat/enums/LoginType.dart';

abstract class NavigatorController {
  void go<T>({required String route, T? args});
  void goAndPop<T>({required String route, T? args});
  void goToSignIn();
  void goToSignInEnter(LoginType loginType);
  void goToSignUp();
  void goToProfile();
  void goToChats();
  void goToChat();
  void showSnackbar(String message);
}
