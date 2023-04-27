import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/lvup_material_name.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final characterScreenWidgetModelProvider =
    ChangeNotifierProvider<CharacterScreenWidgetModel>((ref) => CharacterScreenWidgetModel());

class CharacterScreenWidgetModel extends ChangeNotifier {
  final lvup = LevelUpMaterialList();
  // bool lvupMaterialIsSunday(int id) => lvup.lvupMaterialIsSunday(id);

  String getLvupMaterilaName(BuildContext context, int id) =>
      lvup.getLvUpMaterialName(context, id);

  LvUpMaterialName getMaterialNames(
          BuildContext context, LevelUpMaterial doc) =>
      lvup.materialNames(context, doc);

  String getDomainName(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    final _materialData = LevelUpMaterialList();

    return _materialData.getDomainName(context, talentMaterialData);
  }
  Future<void> pushAddScreen(BuildContext context,LevelUpMaterial talentMaterialData) async {
       final analytics = AnalyticsService();
    await analytics.sendButtonEvent(
        buttonName: talentMaterialData.id.toString());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NotificationAddScreeen(
            talentMaterialData: talentMaterialData,
          );
        },
      ),
    );
  }
}
