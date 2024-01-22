// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/components/AppFormField.dart';
import 'package:talky_chat/components/BlueButton.dart';
import 'package:talky_chat/components/ForgotPasswordButton.dart';
import 'package:talky_chat/components/Logo.dart';
import 'package:talky_chat/components/SignupButton.dart';
import 'package:talky_chat/controllers/interfaces/SignInSocialScreenController.dart';
import 'package:talky_chat/enums/LoginType.dart';
import 'package:talky_chat/mixins/FormValidators.dart';

class SignInSocial extends StatefulWidget {
  const SignInSocial({super.key, required this.loginType});

  final LoginType loginType;

  @override
  State<SignInSocial> createState() => _SignInSocialState();
}

class _SignInSocialState extends State<SignInSocial> with FormValidators {
  late final SignInSocialScreenController screenController;

  @override
  void initState() {
    screenController = context.read<SignInSocialScreenController>();
    screenController.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: screenController.formKey,
              child: Column(
                children: [
                  const Center(child: Logo(size: 40)),
                  const SizedBox(height: 40),
                  Text(
                    'Sign in with ${widget.loginType.name}',
                    style: GoogleFonts.inter(
                      color: AppColors.primaryFontColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppFormField(
                    controller: screenController.email,
                    validator: (p0) => combine([
                      () => isNotEmpty(p0),
                    ]),
                    hint: 'you@example.com',
                    label: 'Email',
                  ),
                  const SizedBox(height: 18),
                  AppFormField(
                    controller: screenController.password,
                    validator: (p0) => combine([
                      () => isNotEmpty(p0),
                    ]),
                    hint: '••••••••',
                    label: 'Password',
                    isVisible: false,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [ForgotPasswordButton()],
                  ),
                  const SizedBox(height: 150),
                  BlueButton(
                    onPressed: screenController.onUserValidation,
                    label: 'Sign in',
                  ),
                  const SizedBox(height: 30),
                  SignupButton(
                    title: 'Don\'t have an account?',
                    buttonLabel: 'Sign up here',
                    onPressed: screenController.onSignUpButtonPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
