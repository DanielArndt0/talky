import 'package:talky_chat/enums/AvailabilityStatus.dart';
import 'package:talky_chat/models/MessageModel.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'json/LocalContact.g.dart';

@JsonSerializable()
class LocalContact implements Comparable<LocalContact> {
  late final String uuid;
  String name;
  AvailabilityStatus availabilityStatus;
  String status;
  String? avatarPath;
  List<MessageModel>? messages;

  LocalContact({
    required this.name,
    this.availabilityStatus = AvailabilityStatus.available,
    this.status = '',
    this.avatarPath,
    this.messages,
  }) {
    uuid = const Uuid().v1();
  }

  factory LocalContact.fromJson(Map<String, dynamic> json) =>
      _$LocalContactFromJson(json);

  Map<String, dynamic> toJson() => _$LocalContactToJson(this);

  @override
  int compareTo(LocalContact other) => uuid == other.uuid &&
          name == other.name &&
          status == other.status &&
          availabilityStatus == other.availabilityStatus &&
          avatarPath == other.avatarPath &&
          messages == other.messages
      ? 0
      : 1;
}
