import 'package:json_annotation/json_annotation.dart';

part 'json/MessageModel.g.dart';

@JsonSerializable()
class MessageModel implements Comparable<MessageModel> {
  String uuid;
  String author;
  String message;
  String timestamp;

  MessageModel({
    required this.uuid,
    required this.author,
    required this.message,
    required this.timestamp,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);

  @override
  int compareTo(MessageModel other) => uuid == other.uuid &&
          author == other.author &&
          message == other.message &&
          timestamp == other.timestamp
      ? 0
      : 1;
}
