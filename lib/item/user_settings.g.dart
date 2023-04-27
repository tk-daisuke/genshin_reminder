// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSettings _$$_UserSettingsFromJson(Map<String, dynamic> json) =>
    _$_UserSettings(
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      imagesSize: (json['imagesSize'] as num?)?.toDouble() ?? 45.11,
      sundayActive: json['sundayActive'] as bool? ?? true,
      travellerSora: json['travellerSora'] as bool? ?? false,
      timezone: json['timezone'] as String,
    );

Map<String, dynamic> _$$_UserSettingsToJson(_$_UserSettings instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'imagesSize': instance.imagesSize,
      'sundayActive': instance.sundayActive,
      'travellerSora': instance.travellerSora,
      'timezone': instance.timezone,
    };
