import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/user_settings.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'notification_payload.freezed.dart';
part 'notification_payload.g.dart';
// flutter pub run build_runner build
// flutter pub run build_runner build    --delete-conflicting-outputs

@freezed
class NotificationPayload with _$NotificationPayload {
  const factory NotificationPayload(
      {required LevelUpMaterial levelUpMaterial,
      required UserSettings userSettings,
      required int noticeID,
      required int weekID,
      required bool loopFlag,
      required String location,
      required String timezone,
      required bool summerTime}) = _NotificationPayload;

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);
  const NotificationPayload._(); //

}
