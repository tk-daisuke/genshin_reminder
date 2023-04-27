import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'user_settings.freezed.dart';
part 'user_settings.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings(
      {required int hour,
      required int minute,
      @Default(45.11) double imagesSize,
      @Default(true) bool sundayActive,
      @Default(false) bool travellerSora,
      required String timezone}) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  const UserSettings._(); // メソッドやカスタムフィールドを追加したい場合追加

  // void getNotificationHour() {
  //   print('${notificationHour.toString()}');
  // }

  // void getTimezone() {
  //   print('${notificationHour.toString()}');
  // }
}
