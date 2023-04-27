// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationPayload _$$_NotificationPayloadFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationPayload(
      levelUpMaterial: LevelUpMaterial.fromJson(
          json['levelUpMaterial'] as Map<String, dynamic>),
      userSettings:
          UserSettings.fromJson(json['userSettings'] as Map<String, dynamic>),
      noticeID: json['noticeID'] as int,
      weekID: json['weekID'] as int,
      loopFlag: json['loopFlag'] as bool,
      location: json['location'] as String,
      timezone: json['timezone'] as String,
      summerTime: json['summerTime'] as bool,
    );

Map<String, dynamic> _$$_NotificationPayloadToJson(
        _$_NotificationPayload instance) =>
    <String, dynamic>{
      'levelUpMaterial': instance.levelUpMaterial,
      'userSettings': instance.userSettings,
      'noticeID': instance.noticeID,
      'weekID': instance.weekID,
      'loopFlag': instance.loopFlag,
      'location': instance.location,
      'timezone': instance.timezone,
      'summerTime': instance.summerTime,
    };
