// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/components/AppFormField.dart';
import 'package:talky_chat/components/BlueButton.dart';
import 'package:talky_chat/components/Logo.dart';
import 'package:talky_chat/components/SignupButton.dart';
import 'package:talky_chat/controllers/interfaces/SignUpScreenController.dart';
import 'package:talky_chat/mixins/FormValidators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with FormValidators {
  late final SignUpScreenController screenController;

  @override
  void initState() {
    screenController = context.read<SignUpScreenController>();
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
                    'Sign up',
                    style: GoogleFonts.inter(
                      color: AppColors.primaryFontColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppFormField(
                    controller: screenController.name,
                    validator: (p0) => combine([
                      () => isNotEmpty(p0),
                    ]),
                    hint: 'Your name',
                    label: 'Name',
                  ),
                  const SizedBox(height: 18),
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
                  const SizedBox(height: 100),
                  BlueButton(
                    onPressed: screenController.onUserValidation,
                    label: 'Continue',
                  ),
                  const SizedBox(height: 30),
                  SignupButton(
                    title: 'Already have an account?',
                    buttonLabel: 'Sign in here',
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
