import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:genshin_reminder/item/lvup_material_name.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/notification_value.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notification_permissions/notification_permissions.dart';

enum NotificationType {
  week1Once,
  week1Loop,
  week2Once,
  week2Loop,
}
final provideNotificationAdd =
    ChangeNotifierProvider<NotificationAddModel>((ref) => NotificationAddModel());

class NotificationAddModel extends ChangeNotifier {
  final _notification = NotificationService();
  final _materialData = LevelUpMaterialList();
  final analytics = AnalyticsService();
  //  String  get materialName1=>;
  // final String materialName2;
  // final String materialName3;

  LvUpMaterialName materialNames(BuildContext context, LevelUpMaterial doc) =>
      _materialData.materialNames(context, doc);

  Future<void> scheduleNotification(
      {required NotificationValue notificationValue}) async {
    // setting.getTimezone();

    _notification.schedulenotification(value: notificationValue);
  }

  Future<void> cancelNotification(int id) async {
    _notification.cancelSelectNotification(notificationID: id);
  }

  Future<void> notificationAdd({
    // required NotificationValue value,
    required bool hasNotification,
    required StateController<UserSettings> userSetting,
    required NotificationType notificationType,
    required LevelUpMaterial doc,
    required BuildContext context,

    // required bool loopFlag
  }) async {
    // ignore: unused_local_variable

    final value = _notification.getNotificationValue(
        context: context,
        doc: doc,
        notificationType: notificationType,
        userSetting: userSetting);
    if (hasNotification) {
      await cancelNotification(value.notificationID);
      await analytics.sendNotificationEvent(
          AnalyticsEvent.notification_delete, value.notificationID);
    } else {
      await NotificationPermissions.requestNotificationPermissions();
      debugPrint('payload: ${value.payload}');
      await scheduleNotification(notificationValue: value);
      await analytics.sendNotificationEvent(
          AnalyticsEvent.notification_add, value.notificationID);
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text(_l10n?.notification_registration)));

    }
  }

  TimeOfDay getTimeOfDay(StateController<UserSettings> userSetting) {
    return TimeOfDay(
        hour: userSetting.state.hour, minute: userSetting.state.minute);
  }

  String getNotificationTitle(BuildContext context,
          LevelUpMaterial talentMaterialData, String materialName) =>
      _materialData.getNotificationTitle(
          context, talentMaterialData, materialName);

  String getWeekName(BuildContext context, int id) {
    return _materialData.getWeekName(context, id);
  }

  String getWorldName(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    return _materialData.getWorldName(context, talentMaterialData);
  }

  String getDomainName(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    return _materialData.getDomainName(context, talentMaterialData);
  }

  String getLvUpMaterialName(BuildContext context, int id) {
    return _materialData.getLvUpMaterialName(context, id);
  }

  String getMaterialWeek(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    return _materialData.getMaterialWeek(context, talentMaterialData);
  }

  // bool lvupMaterialIsSunday(int id) => _materialData.lvupMaterialIsSunday(id);

  Iterable<PendingNotificationRequest> searchNotificationRequest(
      List<PendingNotificationRequest> list, int notificationID) {
    final searchRequest = list.where((e) => e.id == notificationID);
    return searchRequest;
  }

  // Map<String, Object> week1LoopPayload(
  //     TimeOfDay noticeTime,
  //     LevelUpMaterial talentMaterialData,
  //     UserSettings setting,
  //     BuildContext context) {
  //   final week1LoopPayload = {
  //     'talentMaterialID': talentMaterialData.toJson(),
  //     'setting': setting.toJson(),
  //     'noticeID': talentMaterialData.week1NotificationLoopID,
  //     'loopFlag': true,
  //     'weekID': talentMaterialData.week1,
  //   };
  //   return week1LoopPayload;
  // }

}
