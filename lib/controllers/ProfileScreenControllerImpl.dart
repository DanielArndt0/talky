// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky_chat/controllers/interfaces/NavigatorController.dart';
import 'package:talky_chat/controllers/interfaces/ProfileScreenController.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/providers/CurrentUserProvider.dart';
import 'package:talky_chat/services/interfaces/CloudDBService.dart';
import 'package:talky_chat/services/interfaces/MediaPickerService.dart';

class ProfileScreenControllerImpl extends ProfileScreenController {
  final CurrentUserProvider currentUser;
  final NavigatorController navigatorController;
  final MediaPickerService mediaPickerService;
  final CloudDBService CDBService;
  final TextEditingController _statusController = TextEditingController();
  late AvailabilityStatus _availabilityController;
  final _formKey = GlobalKey<FormState>();

  ProfileScreenControllerImpl({
    required this.navigatorController,
    required this.mediaPickerService,
    required this.currentUser,
    required this.CDBService,
  });

  bool get _state => _formKey.currentState!.validate();

  @override
  void initState() {
    _availabilityController = currentUser.localUser.availabilityStatus;
    _statusController.text = currentUser.localUser.status ?? '';
  }

  @override
  void onAvatarPressed() => mediaPickerService
      .getImageFromCamera((file) => currentUser.updateAvatar(file.path));

  @override
  void onAvatarStatusPressed() => mediaPickerService
      .getImageFromCamera((file) => currentUser.updateAvatar(file.path));

  @override
  // TODO: Retornar esta future
  void onValidate() {
    if (_state) {
      currentUser.update(
        status: status.text,
        availabilityStatus: availability,
        isNewUser: false,
      );
      CDBService.updateUser().then((value) {
        navigatorController.goToChats();
      }).onError((error, stackTrace) {
        error as FirebaseAuthException;
        navigatorController.showSnackbar(error.message!);
        navigatorController.goToChats();
      });
    }
  }

  @override
  TextEditingController get status => _statusController;

  @override
  AvailabilityStatus get availability => _availabilityController;

  @override
  void onDropdownChanged(AvailabilityStatus? value) =>
      _availabilityController = value!;

  @override
  GlobalKey<FormState> get formKey => _formKey;
}
