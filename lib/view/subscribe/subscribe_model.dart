import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:genshin_reminder/item/lvup_material_name.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/notification_payload.dart';
import 'package:genshin_reminder/item/server_time.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:timezone/timezone.dart' as tz;

final providerSubscribeModel =
    ChangeNotifierProvider<SubscirebeModel>((ref) => SubscirebeModel());
final subscribeSortProvider = StateProvider<bool>((ref) => true);
final subscribeItemProvider = StateProvider<int>((ref) => 0);
final currentPayload =
    Provider<NotificationPayload>((ref) => throw UnimplementedError());

class SubscirebeModel extends ChangeNotifier {
  final analytics = AnalyticsService();
  final notificationService = NotificationService();
  final _materialData = LevelUpMaterialList();
  Map<String, dynamic> payloadToJSON(String payload) {
    final json = notificationService.payloadToJSON(payload);
    return json;
  }

  NotificationPayload payloadMapToClass(Map<String, dynamic> payloadToJson) {
    final levelUpMaterial = LevelUpMaterial.fromJson(
      payloadToJson['talentMaterialID'] ??
          LevelUpMaterialList().talentLevelUpMaterials[0].toJson(),
    );

    final int noticeID = payloadToJson['noticeID'] ?? 301;
    final bool loopFlag = payloadToJson['loopFlag'] ?? false;
    final bool isSummerTime = payloadToJson['summerTime'];
    final settingSaveData = UserSettings.fromJson(payloadToJson['setting'] ??
        const UserSettings(
          hour: 12,
          minute: 0,
          timezone: ServerTime.local,
        ));

    final int weekID = payloadToJson['weekID'] ?? DateTime.monday;
    final String registeredLocation = payloadToJson['location'];
    final String registeredTimezone = payloadToJson['timezone'];

    final payloadData = NotificationPayload(
        levelUpMaterial: levelUpMaterial,
        userSettings: settingSaveData,
        noticeID: noticeID,
        weekID: weekID,
        loopFlag: loopFlag,
        location: registeredLocation,
        timezone: registeredTimezone,
        summerTime: isSummerTime);
    return payloadData;
  }

  tz.TZDateTime getRegisteredNotificationTime(
      int weekly, int hour, int minute, String timeZone) {
    final location = tz.getLocation(timeZone);
    final locationNow = tz.TZDateTime.now(location);
    final nextTime = notificationService.nextInstanceOfWeekly(
        weekly: weekly, hour: hour, minute: minute, timeZone: locationNow);

    return nextTime;
  }

  Future<void> cancelNotificaiton(
       int noticeID, BuildContext context) async {
    await notificationService.cancelSelectNotification(
        notificationID: noticeID);
    final _l10n = AppLocalizations.of(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(_l10n?.cancel ?? '')));

    await analytics.sendNotificationEvent(
        AnalyticsEvent.notification_delete, noticeID);
  }

  String getWeekName(BuildContext context, int id) {
    return _materialData.getWeekName(context, id);
  }

  LvUpMaterialName getLvUpMaterialNames(
      BuildContext context, LevelUpMaterial doc) {
    return _materialData.materialNames(context, doc);
  }

  String getMaterialWeek(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    return _materialData.getMaterialWeek(context, talentMaterialData);
  }

  String getBadgeNumbar(
      List<PendingNotificationRequest> notificationList, LevelUpMaterial doc) {
    final isSunday = doc.week1 == DateTime.sunday;
    final week1isLoop =
        notificationList.where((e) => e.id == doc.week1NotificationLoopID);
    final week1isOnce =
        notificationList.where((e) => e.id == doc.week1NotificationOnceID);
    final week2isLoop = isSunday
        ? <PendingNotificationRequest>[]
        : notificationList.where((e) => e.id == doc.week2NotificationLoopID);
    final week2isOnce = isSunday
        ? <PendingNotificationRequest>[]
        : notificationList.where((e) => e.id == doc.week2NotificationOnceID);
    final badgeText = (week1isLoop.length +
            week1isOnce.length +
            week2isOnce.length +
            week2isLoop.length)
        .toString();
    return badgeText;
  }

  Future<void> cancelAllNotifications() async {
    notificationService.cancelAllNotifications();
    await analytics.sendNotificationAllCancel();
    // bool lvupMaterialIsSunday(int id) => _materialData.lvupMaterialIsSunday(id);
  }

  bool timeCheck(NotificationPayload notificationPayload) {
    final registeredTime = getRegisteredNotificationTime(
      notificationPayload.weekID,
      notificationPayload.userSettings.hour,
      notificationPayload.userSettings.minute,
      notificationPayload.location,
    );
    // final nowTime = getRegisteredNotificationTime(
    //   notificationPayload.weekID,
    //   notificationPayload.userSettings.hour,
    //   notificationPayload.userSettings.minute,
    //   tz.local.name,
    // );

    final nowTime = registeredTime.toLocal();
    // print(notificationPayload.location);
    // print(tz.local.name);
    // print('registeredTime$registeredTime');
    // print('nowTime${nowTime}');
    //tzがずれたかどうかの確認 （夏時間は通過させる）

    final registered = DateTime(
      registeredTime.year,
      registeredTime.month,
      registeredTime.day,
      registeredTime.hour,
      registeredTime.minute,
    );
    final now = DateTime(
      nowTime.year,
      nowTime.month,
      nowTime.day,
      nowTime.hour,
      nowTime.minute,
    );

    return registered != now;
  }

  Future<void> editNotificaiton(
 
      BuildContext context,
      StateController<UserSettings> setting,
      NotificationPayload payload) async {
    final _l10n = AppLocalizations.of(context);

    final week1 = payload.weekID == DateTime.monday ||
        payload.weekID == DateTime.tuesday ||
        payload.weekID == DateTime.wednesday ||
        payload.weekID == DateTime.sunday;
    final NotificationType notificationType;
    if (payload.loopFlag) {
      if (week1) {
        notificationType = NotificationType.week1Loop;
      } else {
        notificationType = NotificationType.week2Loop;
      }
    } else {
      if (week1) {
        notificationType = NotificationType.week1Once;
      } else {
        notificationType = NotificationType.week2Once;
      }
    }
    final timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: payload.userSettings.hour, minute: payload.userSettings.minute),
    );
    // builder: (BuildContext buildercontext, Widget? child) {
    //     return MediaQuery(
    //         data: MediaQuery.of(context).copyWith(
    //           alwaysUse24HourFormat: true,
    //           textScaleFactor: 1,
    //         ),
    //         child: child!);
    //   },
    // );
    if (timeOfDay != null) {
      setting.state = UserSettings(
        hour: timeOfDay.hour,
        minute: timeOfDay.minute,
        timezone: setting.state.timezone,
      );
      await notificationAdd(
        context: context,
        doc: payload.levelUpMaterial,
        notificationType: notificationType,
        userSetting: setting,
      );
      await analytics.sendNotificationEvent(
          AnalyticsEvent.notification_edit, payload.noticeID);
      final snackBar = SnackBar(
        content: Text(_l10n?.changed_time ?? ''),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> notificationAdd({
    // required NotificationValue value,
    required StateController<UserSettings> userSetting,
    required NotificationType notificationType,
    required LevelUpMaterial doc,
    required BuildContext context,

    // required bool loopFlag
  }) async {
    // ignore: unused_local_variable
    final _notification = NotificationService();

    final value = _notification.getNotificationValue(
        context: context,
        doc: doc,
        notificationType: notificationType,
        userSetting: userSetting);

    await NotificationPermissions.requestNotificationPermissions();

    await _notification.schedulenotification(value: value);
    // ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text(_l10n?.notification_registration)));
  }
}
