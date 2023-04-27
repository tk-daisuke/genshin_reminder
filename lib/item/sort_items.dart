import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:genshin_reminder/item/notification_payload.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'sort_items.freezed.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class SortItems with _$SortItems {
  const factory SortItems({
    required NotificationPayload payload,
    required int id,
  }) = _SortItems;

  // factory SortItems.fromJson(Map<String, dynamic> json) =>
  //     _$SortItemsFromJson(json);

  const SortItems._(); // メソッドやカスタムフィールドを追加したい場合追加

  // void getNotificationHour() {
  //   print('${notificationHour.toString()}');
  // }

  // void getTimezone() {
  //   print('${notificationHour.toString()}');
  // }
}
