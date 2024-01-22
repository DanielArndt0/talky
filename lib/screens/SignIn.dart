// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky_chat/app/AppAssets.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/NamedRoutes.dart';
import 'package:talky_chat/components/Logo.dart';
import 'package:talky_chat/components/SignInButton.dart';
import 'package:talky_chat/components/SignupButton.dart';
import 'package:talky_chat/components/TextDivider.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/enums/LoginType.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorController = context.read<NavigatorController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.screenBackground[NamedRoutes.signIn],
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: ListView(
            children: [
              const SizedBox(height: 70),
              const Center(child: Logo(size: 60.0)),
              const SizedBox(height: 60),
              _SectionButton(
                navigatorController: navigatorController,
                loginType: LoginType.Talky,
                icon: const Logo(size: 16),
                bottomPadding: 16,
              ),
              _SectionButton(
                navigatorController: navigatorController,
                loginType: LoginType.Google,
                icon: Image.asset(AppAssets.googleIcon),
                bottomPadding: 16,
              ),
              _SectionButton(
                navigatorController: navigatorController,
                loginType: LoginType.Facebook,
                icon: Image.asset(AppAssets.facebookIcon),
                bottomPadding: 16,
              ),
              _SectionButton(
                navigatorController: navigatorController,
                loginType: LoginType.Apple,
                icon: Image.asset(AppAssets.appleIcon),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: TextDivider(label: 'or'),
              ),
              _SectionButton(
                navigatorController: navigatorController,
                loginType: LoginType.Phone,
                label: 'Continue with phone number',
                bottomPadding: 50,
              ),
              SignupButton(
                title: 'Don\'t have an account?',
                buttonLabel: 'Sign up here',
                onPressed: navigatorController.goToSignUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionButton extends StatelessWidget {
  final NavigatorController navigatorController;
  final LoginType loginType;
  final String? label;
  final Widget? icon;
  final double? bottomPadding;

  const _SectionButton({
    required this.loginType,
    required this.navigatorController,
    this.label,
    this.icon,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 0.0),
      child: SigninButton(
        label: label ?? "Sign in with ${loginType.name}",
        onPressed: () => navigatorController.goToSignInEnter(loginType),
        icon: icon,
      ),
    );
  }
}
