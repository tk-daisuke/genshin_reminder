
import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providertNotificationResultModel =
    ChangeNotifierProvider<NotificationResultModel>((ref) => NotificationResultModel());

class NotificationResultModel extends ChangeNotifier {
  final _materialData = LevelUpMaterialList();

  // LevelUpMaterial payloadToMaterialData(
  //     BuildContext context, int levelUpMaterialID) {
  //   return _materialData.payloadToMaterialData(context, levelUpMaterialID);
  // }

  String getNotificationTitle(BuildContext context,
          LevelUpMaterial talentMaterialData, String materialName) =>
      _materialData.getNotificationTitle(
          context, talentMaterialData, materialName);

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

  Map<String, dynamic> payloadToJSON(String payload) {
    final notificationService = NotificationService();
    final json = notificationService.payloadToJSON(payload);
    return json;
  }
}
