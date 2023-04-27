import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/notification_value.dart';
import 'package:genshin_reminder/item/server_time.dart';
import 'package:genshin_reminder/item/sort_items.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_model.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

final providerGetNotificationList =
    FutureProvider<List<PendingNotificationRequest>>((ref) async {
  final notificaitons = ref.read(notificaitonItems.state);
  final sort = ref.read(subscribeSortProvider.state);
  final sortMap = ref.read(sortedListProvider.state);
  final getNotificationList =
      await FlutterLocalNotificationsPlugin().pendingNotificationRequests();
  notificaitons.state = getNotificationList;

  final sortedList = getNotificationList.map((e) {
    final _model = SubscirebeModel();
    final payloadToJSON = _model.payloadToJSON(e.payload!);
    final payload = _model.payloadMapToClass(payloadToJSON);
    return SortItems(payload: payload, id: payload.noticeID);
  }).toList()..sort((a, b) {return
    sort.state? 
     a.id.compareTo(b.id) :a.payload.weekID.compareTo(b.payload.weekID);
  });
  
  sortMap.state = sortedList;
  return getNotificationList;
});

final notificaitonItems = StateProvider<List<PendingNotificationRequest>>(
  (ref) => [],
);
final sortedListProvider =
    StateProvider<List<SortItems>>((ref) => <SortItems>[]);

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Future<void> showInstantNotification(
  //     int id, String title, String message, String payload) async {
  //   const ios = IOSNotificationDetails();
  //   const android = AndroidNotificationDetails('id', 'channel', 'description');
  //   const notificationSetting = NotificationDetails(android: android, iOS: ios);

  //   debugPrint(payload);

  //   await _notificationsPlugin.show(id, title, message, notificationSetting,
  //       payload: payload);
  // }

  TZDateTime getSettingTimezone(UserSettings setting) {
    // DateTime::TimeZone タイムゾーン名一覧
    // https://perlzemi.com/blog/20081101122558.html
    final na = tz.getLocation('America/New_York');
    final eu = tz.getLocation('Europe/Rome');
    final azia = tz.getLocation('Asia/Tokyo');
    if (setting.timezone == ServerTime.asia) {
      return tz.TZDateTime.now(azia);
    } else if (setting.timezone == ServerTime.na) {
      return tz.TZDateTime.now(na);
    } else if (setting.timezone == ServerTime.eu) {
      return tz.TZDateTime.now(eu);
    } else if (setting.timezone == ServerTime.local) {
      return tz.TZDateTime.now(tz.local);
    } else {
      return tz.TZDateTime.now(tz.local);
    }

    // else if (setting.timezone == ServerTime.tw_hk_mo) {
    //   //azia と同じなので azia
    //   return tz.TZDateTime.now(azia);
    // }
  }

  Future<void> schedulenotification({required NotificationValue value}) async {
    const ios = IOSNotificationDetails();
    const android = AndroidNotificationDetails('id', 'channel', 'description');
    final userSelecetTimeZone = getSettingTimezone(value.setting);
    final interval = nextInstanceOfWeekly(
      hour: value.setting.hour,
      weekly: value.weekID,
      timeZone: userSelecetTimeZone,
      minute: value.setting.minute,
    );

    await _notificationsPlugin.zonedSchedule(
      value.notificationID, value.title,
      value.comment,
      interval, const NotificationDetails(iOS: ios, android: android),
      payload: value.payload,
      //Androidでは、androidAllowWhileIdleデバイスが低電力アイドルモードの場合でも、
      // 指定された時間に通知を配信するかどうかを決定するために使用されます。
      androidAllowWhileIdle: true,
// iOS8.0以降。10より古いバージョンのiOSでは、プラグインはUILocalNotificationAPIを使用します。
// UserNotification APIは（ユーザー通知フレームワーク別名）のiOS 10以降で使用されています。
// 10より古いバージョンのiOSで使用される通知API（別名UILocalNotificationAPI）は、
// スケジュールされた通知と夏時間 タイムゾーンでのサポートが制限されています。

      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,

// matchDateTimeComponentsプラグインに時刻または曜日と時刻の組み合わせにそれぞれ一致するように指示することにより、
// 通知が毎日または毎週表示されるようにスケジュールするために使用できるオプションのパラメーターがあります。
      matchDateTimeComponents:
          value.loopFlag ? DateTimeComponents.dayOfWeekAndTime : null,
    );
  }

  tz.TZDateTime nextInstanceOfWeekly(
      {required int weekly,
      required int hour,
      required int minute,
      required TZDateTime timeZone}) {
    var scheduledDate =
        _nextInstance(hour: hour, timeZone: timeZone, minute: minute);
    while (scheduledDate.weekday != weekly) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    // print('_nextInstanceOfWeekly scheduledDate$scheduledDate');

    return scheduledDate;
  }

  tz.TZDateTime _nextInstance(
      {required int hour, required int minute, required TZDateTime timeZone}) {
    final now = tz.TZDateTime.now(timeZone.location);

    var scheduledDate = tz.TZDateTime(
        timeZone.location, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(timeZone)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    // print('_nextInstance scheduledDate$scheduledDate');
    return scheduledDate;
  }

  Future<List<PendingNotificationRequest>> getNotificationList() async =>
      _notificationsPlugin.pendingNotificationRequests();

  Future<void> cancelSelectNotification({required int notificationID}) async =>
      _notificationsPlugin.cancel(notificationID);

  Future<void> cancelAllNotifications() async =>
      _notificationsPlugin.cancelAll();

  Future<void> configureLocalTimeZone() async {
    // timezoneパッケージは、デバイスの現在のタイムゾーンを取得する方法を提供しないため、
    // 開発者はプラットフォームチャネルを使用するか、
    // 情報を提供できる可能性のある他のパッケージを使用する必要があります。
    // サンプルアプリはflutter_native_timezoneプラグインを使用しています。

    tz.initializeTimeZones();
    final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Map<String, dynamic> payloadToJSON(String payload) {
    return jsonDecode(payload);
  }

  NotificationValue getNotificationValue({
    required NotificationType notificationType,
    required LevelUpMaterial doc,
    required BuildContext context,
    required StateController<UserSettings> userSetting,
  }) {
    final _l10n = AppLocalizations.of(context);
    final _materialData = LevelUpMaterialList();
    final materialName = _materialData.materialNames(context, doc);
    final materialName1 = materialName.materialName1;
    final materialName2 = materialName.materialName2;
    final materialName3 = materialName.materialName3;

    final worldName = _materialData.getWorldName(context, doc);
    final domainName = _materialData.getDomainName(context, doc);
    final noticeTime = TimeOfDay(
        hour: userSetting.state.hour, minute: userSetting.state.minute);
    final title = _materialData.getNotificationTitle(
        context, doc, '$materialName1 $materialName2 $materialName3');
    final commentTitle = _l10n!.notification_item(
        '$materialName1 $materialName2 $materialName3 ',
        '$worldName $domainName');

    final week1Name = _materialData.getWeekName(context, doc.week1);
    final week2Name = _materialData.getWeekName(context, doc.week2);

    final week1LoopPayload = _payloadConverter(doc, userSetting.state,
        noticeID: doc.week1NotificationLoopID,
        weekID: doc.week1,
        loopFlag: true);

    final week1OncePayload = _payloadConverter(
      doc,
      userSetting.state,
      loopFlag: false,
      noticeID: doc.week1NotificationOnceID,
      weekID: doc.week1,
    );
    final week2LoopPayload = _payloadConverter(
      doc,
      userSetting.state,
      loopFlag: true,
      noticeID: doc.week2NotificationLoopID,
      weekID: doc.week2,
    );
    final week2OncePayload = _payloadConverter(
      doc,
      userSetting.state,
      loopFlag: false,
      noticeID: doc.week2NotificationOnceID,
      weekID: doc.week2,
    );
    final week1LoopComment = commentTitle +
        _l10n.notification_settingstime(
            noticeTime.format(context), week1Name, _l10n.weekly);
    final week1OnceComment = commentTitle +
        _l10n.notification_settingstime(
            noticeTime.format(context), week1Name, _l10n.only_once);
    final week2LoopComment = commentTitle +
        _l10n.notification_settingstime(
            noticeTime.format(context), week2Name, _l10n.weekly);
    final week2OneceComment = commentTitle +
        _l10n.notification_settingstime(
            noticeTime.format(context), week2Name, _l10n.only_once);

    if (notificationType == NotificationType.week1Once) {
      return NotificationValue(
        title: title,
        comment: week1OnceComment,
        payload: jsonEncode(week1OncePayload),
        notificationID: doc.week1NotificationOnceID,
        weekID: doc.week1,
        setting: userSetting.state,
        loopFlag: false,
      );
    } else if (notificationType == NotificationType.week1Loop) {
      return NotificationValue(
        title: title,
        comment: week1LoopComment,
        payload: jsonEncode(week1LoopPayload),
        notificationID: doc.week1NotificationLoopID,
        weekID: doc.week1,
        setting: userSetting.state,
        loopFlag: true,
      );
    } else if (notificationType == NotificationType.week2Once) {
      return NotificationValue(
        title: title,
        comment: week2OneceComment,
        payload: jsonEncode(week2OncePayload),
        notificationID: doc.week2NotificationOnceID,
        weekID: doc.week2,
        setting: userSetting.state,
        loopFlag: false,
      );
    } else if (notificationType == NotificationType.week2Loop) {
      return NotificationValue(
        title: title,
        comment: week2LoopComment,
        payload: jsonEncode(week2LoopPayload),
        notificationID: doc.week2NotificationLoopID,
        setting: userSetting.state,
        loopFlag: true,
        weekID: doc.week2,
      );
    } else {
      return NotificationValue(
        title: 'error',
        comment: 'error',
        payload: jsonEncode(week2LoopPayload),
        notificationID: 10000,
        setting: userSetting.state,
        loopFlag: false,
        weekID: doc.week2,
      );
    }
  }

  Map<String, Object> _payloadConverter(
    LevelUpMaterial talentMaterialData,
    UserSettings setting, {
    required int noticeID,
    required int weekID,
    required bool loopFlag,
  }) {
    final location = tz.local;
    final payload = {
      // 'noticeTime': noticeTime.format(context),
      'talentMaterialID': talentMaterialData.toJson(),
      'setting': setting.toJson(),
      'noticeID': noticeID,
      'loopFlag': loopFlag,
      'weekID': weekID,
      'location': location.name,
      'timezone': location.currentTimeZone.abbreviation,
      'summerTime': location.currentTimeZone.isDst
    };
    return payload;
  }
}

  // Future<void> show5SecondsNotification() async {
  //   final interval =
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));
  //   const ios = IOSNotificationDetails();
  //   const android = AndroidNotificationDetails('id',
  //'channel', 'description');

  //   await _notificationsPlugin.zonedSchedule(
  //       0,
  //       'scheduled title',
  //       'scheduled body',
  //       interval,
  //       const NotificationDetails(iOS: ios, android: android),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }

// これ
  // Future<void> scheduleWeeklyMondayTenAMNotification() async {
  //   await _notificationsPlugin.zonedSchedule(
  //       0,
  //       'weekly scheduled notification title',
  //       'weekly scheduled notification body',
  //       _nextInstanceOfMondayTenAM(),
  //       const NotificationDetails(
  //         android: AndroidNotificationDetails(
  //             'weekly notification channel id',
  //             'weekly notification channel name',
  //             'weekly notificationdescription'),
  //       ),
  //       androidAllowWhileIdle: true,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
  // }

  // tz.TZDateTime _nextInstanceOfTenAM() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }