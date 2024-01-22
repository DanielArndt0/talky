// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talky_chat/app/AppColors.dart';
import 'package:talky_chat/components/AppFormField.dart';
import 'package:talky_chat/components/AvatarImage.dart';
import 'package:talky_chat/components/BlueButton.dart';
import 'package:talky_chat/components/DropdownField.dart';
import 'package:talky_chat/components/UserAvatar.dart';
import 'package:talky_chat/controllers/interfaces/ProfileScreenController.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/mixins/FormValidators.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with FormValidators {
  late final ProfileScreenController screenController;

  @override
  void initState() {
    screenController = context.read<ProfileScreenController>();
    screenController.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Profile',
              style: GoogleFonts.inter(
                color: AppColors.primaryFontColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: screenController.formKey,
            child: ListView(
              children: [
                Center(
                  child: Consumer<CurrentUserProvider>(
                    builder: (context, currentUser, child) => UserAvatar(
                      radius: 190,
                      status: AvailabilityStatus.inCall,
                      statusAction: screenController.onAvatarStatusPressed,
                      avatarAction: screenController.onAvatarPressed,
                      statusIcon: const Icon(
                        Icons.edit_outlined,
                        color: Colors.white,
                      ),
                      avatar: AvatarImage(
                        avatarPath: currentUser.localUser.avatarPath,
                        userId: currentUser.localUser.uuid!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Consumer<CurrentUserProvider>(
                  builder: (
                    BuildContext context,
                    CurrentUserProvider currentUser,
                    Widget? child,
                  ) =>
                      AppFormField(
                    controller: screenController.status,
                    label: 'Status',
                    hint: 'Today is a better day',
                  ),
                ),
                const SizedBox(height: 18),
                Consumer<CurrentUserProvider>(
                  builder: (
                    BuildContext context,
                    CurrentUserProvider currentUser,
                    Widget? child,
                  ) =>
                      DropdownField(
                    label: 'Availability',
                    onChanged: screenController.onDropdownChanged,
                    standardValue: currentUser.localUser.availabilityStatus,
                  ),
                ),
                const SizedBox(height: 90),
                BlueButton(
                  onPressed: screenController.onValidate,
                  label: 'Complete',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
