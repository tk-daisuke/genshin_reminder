// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:genshin_reminder/item/material/levelup_material.dart';
// import 'package:genshin_reminder/item/material/levelup_material_types.dart';
// import 'package:genshin_reminder/item/notification_value.dart';
// import 'package:genshin_reminder/service/notification_service.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final weeklySelectIndex = StateProvider((ref) => 0);
// final debugProvider = ChangeNotifierProvider((ref) => DebugModel());

// const List<String> japaneseWeeklist = [
//   'set',
//   '月曜日',
//   '火曜日',
//   '水曜日',
//   '木曜日',
//   '金曜日',
//   '土曜日',
//   '日曜日',
// ];

// class DebugModel extends ChangeNotifier {
//   final _notification = NotificationService();

//   Future<void> showInstantNotification() async {
//     final week1OncePayload = {
//       'noticeTime': '12:00 AM',
//       'talentMaterialID': const LevelUpMaterial(
//         id: TalentMaterials.violetCourt,
//         week1: DateTime.sunday,
//         week2: DateTime.sunday,
//         week1NotificationLoopID: 301,
//         week1NotificationOnceID: 302,
//         week2NotificationLoopID: 301,
//         week2NotificationOnceID: 302,
//         worldID: WorldID.inazuma,
//         domainID: DomainID.violetCourt,
//         materialTypeID: LevelUpMaterialType.character,
//       ).toJson(),
//       'noticeID': '${300}',
//     };

//     _notification.showInstantNotification(
//         10, 'タイトル', 'メッセージ', jsonEncode(week1OncePayload));
//   }

//   Future<void> scheduleNotification(
//       {required NotificationValue notificationValue}) async {
//     // setting.getTimezone();

//     _notification.schedulenotification(value: notificationValue);
//   }

//   Future<void> cancelAllNotifications() =>
//       _notification.cancelAllNotifications();
// }
