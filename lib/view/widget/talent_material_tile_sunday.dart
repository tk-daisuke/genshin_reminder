import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/view/widget/character/character_screen_widget_model.dart';
import 'package:genshin_reminder/view/widget/lvup_material_avater.dart';
import 'package:genshin_reminder/view/widget/notificaiton/notification_count_badge.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LvupMaterialSunday extends HookConsumerWidget {
  const LvupMaterialSunday({
    required this.talentMaterialData,
    this.sundayActive = true,
    Key? key,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;
  final bool sundayActive;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);
    final _model = ref.watch(characterScreenWidgetModelProvider);

    // ignore: unused_local_variable
    final _size = MediaQuery.of(context).size;
    return sundayActive
        ? InkWell(
            onTap: () async {
              await _model.pushAddScreen(context, talentMaterialData);
            },
            child: Row(
              children: [
                // const SizedBox(
                //   width: 10,
                // ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          bottom: 10,
                        ),
                        child: AutoSizeText(
                          _l10n?.sunday_all ?? '',
                          textScaleFactor: 1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          maxFontSize: 20,
                          minFontSize: 10,
                        ),
                      ),
                      NotificationCountBadge(
                        talentMaterialData: talentMaterialData,
                        // position: BadgePosition.topStart(top: -10, start: -2),
                        // position: BadgePosition.topStart(top: -10),
                        position: BadgePosition.topEnd(top: -15, end: -10),
                        child: const Icon(
                          Icons.notifications,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Row(children: [
                    Expanded(
                      child: LvupMaterialAvater(
                        talentMaterialData: talentMaterialData,
                        id: talentMaterialData.id + 10,
                        onChip: false,
                      ),
                    ),
                    Expanded(
                      child: LvupMaterialAvater(
                        talentMaterialData: talentMaterialData,
                        id: talentMaterialData.id + 20,
                        onChip: false,
                      ),
                    ),
                    Expanded(
                      child: LvupMaterialAvater(
                        talentMaterialData: talentMaterialData,
                        id: talentMaterialData.id + 30,
                        onChip: false,
                      ),
                    ),
                  ]),
                ),

                // Expanded(
                //   flex: 1,
                //   child: PushAddScreenButton(
                //     talentMaterialData: talentMaterialData,
                //   ),
                // ),
                // Center(
                //   child: Image(
                //     image: AssetImage('assets/images/material/$id.png'),
                //     height: 60,
                //   ),
                // ),
              ],
            ),
          )
        : // 日曜日が非表示の場合
        // TODO(u): 日曜非表示設定に通知するか考える
        Container();
  }
}
