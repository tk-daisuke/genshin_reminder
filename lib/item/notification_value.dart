import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genshin_reminder/item/user_settings.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'notification_value.freezed.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class NotificationValue with _$NotificationValue {
  const factory NotificationValue(
      {required int notificationID,
      required int weekID,
      required UserSettings setting,
      required String title,
      required String comment,
      required String payload,
      required bool loopFlag}) = _NotificationValue;
  const NotificationValue._(); // メソッドやカスタムフィールドを追加したい場合追加

}
