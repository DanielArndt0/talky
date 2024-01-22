// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../LocalUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalUser _$LocalUserFromJson(Map<String, dynamic> json) => LocalUser(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      availabilityStatus: $enumDecodeNullable(
              _$AvailabilityStatusEnumMap, json['availabilityStatus']) ??
          AvailabilityStatus.available,
      isNewUser: json['isNewUser'] as bool? ?? true,
      status: json['status'] as String?,
      avatarPath: json['avatarPath'] as String?,
      contacts: (json['contacts'] as List<dynamic>?)
          ?.map((e) => LocalContact.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocalUserToJson(LocalUser instance) => <String, dynamic>{
      'availabilityStatus':
          _$AvailabilityStatusEnumMap[instance.availabilityStatus]!,
      'isNewUser': instance.isNewUser,
      'uuid': instance.uuid,
      'name': instance.name,
      'avatarPath': instance.avatarPath,
      'status': instance.status,
      'contacts': instance.contacts,
    };

const _$AvailabilityStatusEnumMap = {
  AvailabilityStatus.available: 'available',
  AvailabilityStatus.away: 'away',
  AvailabilityStatus.busy: 'busy',
  AvailabilityStatus.inCall: 'inCall',
};
