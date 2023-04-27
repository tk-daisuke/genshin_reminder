import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/view/notification_result/notification_result_model.dart';
import 'package:genshin_reminder/view/widget/domain/domain_info.dart';

class NotificationResultScreen extends StatelessWidget {
  const NotificationResultScreen({Key? key, required this.payload})
      : super(key: key);
  final String payload;

  @override
  Widget build(BuildContext context) {
    // final _l10n = AppLocalizations.of(context);
    final notificationResultModel = NotificationResultModel();
    final payloadToJson = notificationResultModel.payloadToJSON(payload);

    final Map<String, dynamic> dataBase;

    if (payloadToJson['levelUpMaterial'] != null) {
      dataBase = payloadToJson['levelUpMaterial'];
    } else if (payloadToJson['talentMaterialID'] != null) {
      dataBase = payloadToJson['talentMaterialID'];
    } else {
      dataBase = LevelUpMaterialList().talentLevelUpMaterials[0].toJson();
    }
    final talentMaterialData = LevelUpMaterial.fromJson(dataBase);
    // final setting = UserSettings.fromJson(
    //   payloadToJson['setting'] ??
    //       const UserSettings(
    //         hour: 12,
    //         minute: 0,
    //         timezone: ServerTime.local,
    //       ).toJson(),
    // );

    // final int noticeID = payloadToJson['noticeID'] ?? 301;
    // final bool loop = payloadToJson['loopFlag'] ?? false;

    // print(notificationTime);
    // print(noticeID);
    return Scaffold(
      appBar: AppBar(
          // title: Text(''),
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            DomainInfo(
              talentMaterialData: talentMaterialData,
            ),
            const SizedBox(
              height: 200,
            )
          ]),
        ),
      ),
    );
    // );
    //         }),
    //       ],
    //     )),
    //   ),
    // );
  }
}

class LevelUpMaterialDitile extends StatelessWidget {
  const LevelUpMaterialDitile({
    Key? key,
    required this.path,
    required this.materialName1,
    required this.materialName2,
    required this.materialName3,
  }) : super(key: key);

  final String path;
  final String materialName1;
  final String materialName2;
  final String materialName3;

  @override
  Widget build(BuildContext context) {
    return Row(
      // alignment: WrapAlignment.center,
      // runAlignment: WrapAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 74,
          image: AssetImage(path),
        ),
        Column(
          children: [
            Text(
              materialName1,
              textScaleFactor: 1,
            ),
            if (materialName2 != '')
              Text(
                materialName2,
                textScaleFactor: 1,
              ),
            if (materialName3 != '')
              Text(
                materialName3,
                textScaleFactor: 1,
              ),
          ],
        ),
      ],
    );
  }
}
