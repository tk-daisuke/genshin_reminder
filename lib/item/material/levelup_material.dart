// ignore: file_names
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'levelup_material.freezed.dart';
part 'levelup_material.g.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs
@freezed
class LevelUpMaterial with _$LevelUpMaterial {
  const factory LevelUpMaterial(
      {required int id,
      required int week1,
      required int week2,
      required int week1NotificationLoopID,
      required int week1NotificationOnceID,
      required int week2NotificationLoopID,
      required int week2NotificationOnceID,
      required int worldID,
      required int domainID,
      // @Default([]) List characterList,
      // @Default([]) List weaponList,
      // @Default([]) List<Character> characterList,
      required int materialTypeID}) = _LevelUpMaterial;
  // ignore: unused_element
  // const LevelUpMaterial._(); // メソッドやカスタムフィールドを追加したい場合追加

  factory LevelUpMaterial.fromJson(Map<String, dynamic> json) =>
      _$LevelUpMaterialFromJson(json);

  // void getNotificationHour() {
  //   print('${weekly1.toString()}');
  // }

}

  // void getTimezone() {
  //   print('${notificationHour.toString()}');
  // }

