// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/models/LocalContact.dart';

part 'json/LocalUser.g.dart';

@JsonSerializable()
class LocalUser implements Comparable<LocalUser> {
  AvailabilityStatus availabilityStatus;
  bool isNewUser;
  String? uuid;
  String? name;
  String? avatarPath;
  String? status;
  List<LocalContact>? contacts;

  LocalUser({
    this.uuid,
    this.name,
    this.availabilityStatus = AvailabilityStatus.available,
    this.isNewUser = true,
    this.status,
    this.avatarPath,
    this.contacts,
  });

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);

  Map<String, dynamic> toJson() => _$LocalUserToJson(this);

  void update({
    String? uuid,
    String? name,
    AvailabilityStatus? availabilityStatus,
    bool? isNewUser,
    String? avatarPath,
    String? status,
  }) {
    this.uuid = uuid ?? this.uuid;
    this.name = name ?? this.name;
    this.availabilityStatus = availabilityStatus ?? this.availabilityStatus;
    this.isNewUser = isNewUser ?? this.isNewUser;
    this.avatarPath = avatarPath ?? this.avatarPath;
    this.status = status ?? this.status;
  }

  void updateUuid(String uuid) => this.uuid = uuid;
  void updateName(String name) => this.name = name;
  void updateAvailabilityStatus(AvailabilityStatus availabilityStatus) =>
      this.availabilityStatus = availabilityStatus;
  void updateAvatar(String path) => avatarPath = path;
  void updateStatus(String status) => this.status = status;
  void updateContacts(List<LocalContact> contacts) => this.contacts = contacts;
  void updateIsNewUser(bool isNewUser) => this.isNewUser = isNewUser;
  void addContact(LocalContact contact) => contacts?.add(contact);

  @override
  int compareTo(LocalUser other) => name == other.name &&
          uuid == other.uuid &&
          availabilityStatus == other.availabilityStatus &&
          status == other.status &&
          avatarPath == other.avatarPath
      ? 0
      : 1;
}
