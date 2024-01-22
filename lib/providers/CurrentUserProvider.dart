// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/models/LocalUser.dart';

class CurrentUserProvider extends ChangeNotifier {
  LocalUser _user = LocalUser();
  UserCredential? _userCredential;

  LocalUser get localUser => _user;
  UserCredential? get userCredential => _userCredential;

  void updateCurrentUser({
    required LocalUser localUser,
    required UserCredential credential,
  }) {
    _user = localUser;
    _userCredential = _userCredential;
  }

  void update({
    String? name,
    AvailabilityStatus? availabilityStatus,
    String? avatarPath,
    String? status,
    UserCredential? credential,
    bool? isNewUser,
  }) {
    _user.update(
      name: name,
      availabilityStatus: availabilityStatus,
      avatarPath: avatarPath,
      status: status,
      isNewUser: isNewUser,
    );
    if (credential != null) {
      updateUserCredential(credential);
    }
    notifyListeners();
  }

  void updateUserCredential(UserCredential userCredential) {
    _userCredential = userCredential;
    _user.updateUuid(userCredential.user!.uid);
    notifyListeners();
  }

  void updateLocalUser(LocalUser localUser) {
    _user = localUser;
    notifyListeners();
  }

  void updateName(String name) {
    _user.updateName(name);
    notifyListeners();
  }

  void updateAvailabilityStatus(AvailabilityStatus availabilityStatus) {
    _user.updateAvailabilityStatus(availabilityStatus);
    notifyListeners();
  }

  void updateAvatar(String path) {
    _user.updateAvatar(path);
    notifyListeners();
  }

  void updateStatus(String status) {
    _user.updateStatus(status);
    notifyListeners();
  }

  void updateIsNewUser(bool isNewUser) {
    _user.updateIsNewUser(isNewUser);
    notifyListeners();
  }
}
