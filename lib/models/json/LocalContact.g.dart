part of '../LocalContact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalContact _$LocalContactFromJson(Map<String, dynamic> json) => LocalContact(
      name: json['name'] as String,
      availabilityStatus: $enumDecodeNullable(
              _$AvailabilityStatusEnumMap, json['availabilityStatus']) ??
          AvailabilityStatus.available,
      status: json['status'] as String? ?? '',
      avatarPath: json['avatarPath'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..uuid = json['uuid'] as String;

Map<String, dynamic> _$LocalContactToJson(LocalContact instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'availabilityStatus':
          _$AvailabilityStatusEnumMap[instance.availabilityStatus]!,
      'status': instance.status,
      'avatarPath': instance.avatarPath,
      'messages': instance.messages,
    };

const _$AvailabilityStatusEnumMap = {
  AvailabilityStatus.available: 'available',
  AvailabilityStatus.away: 'away',
  AvailabilityStatus.busy: 'busy',
  AvailabilityStatus.inCall: 'inCall',
};
