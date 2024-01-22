// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:talky_chat/NamedRoutes.dart';
import 'package:talky_chat/enums/LoginType.dart';
import 'package:talky_chat/screens/Chat.dart';
import 'package:talky_chat/screens/Chats.dart';
import 'package:talky_chat/screens/Profile.dart';
import 'package:talky_chat/screens/SignIn.dart';
import 'package:talky_chat/screens/SignInSocial.dart';
import 'package:talky_chat/screens/SignUp.dart';

class Routes {
  static final handler = {
    NamedRoutes.signIn: (context) => _Page<void>(
          context,
          (args) => const SignIn(),
        ),
    NamedRoutes.signInEnter: (context) => _Page<LoginType>(
          context,
          (args) => SignInSocial(loginType: args),
        ),
    NamedRoutes.signUp: (context) => _Page<void>(
          context,
          (args) => const SignUp(),
        ),
    NamedRoutes.profile: (context) => _Page<void>(
          context,
          (args) => const Profile(),
        ),
    NamedRoutes.chats: (context) => _Page<void>(
          context,
          (args) => const Chats(),
        ),
    NamedRoutes.chat: (context) => _Page<void>(
          context,
          (args) => const Chat(),
        ),
  };

  // ignore: non_constant_identifier_names
  static Widget _Page<T>(BuildContext context, Widget Function(T) onPage) =>
      onPage(ModalRoute.of(context)!.settings.arguments as T);
}
