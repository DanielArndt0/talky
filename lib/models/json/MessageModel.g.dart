part of '../MessageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      uuid: json['uuid'] as String,
      author: json['author'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'author': instance.author,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
