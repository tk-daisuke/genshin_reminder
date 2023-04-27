import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/character/characters_list.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/item/weapon/weapon.dart';
import 'package:genshin_reminder/item/weapon/weapon_list.dart';
import 'package:genshin_reminder/view/weapon/weapon_model.dart';
import 'package:genshin_reminder/view/widget/character/character_avater.dart';
import 'package:genshin_reminder/view/widget/character/character_screen_widget_model.dart';
import 'package:genshin_reminder/view/widget/lvup_material_avater.dart';
import 'package:genshin_reminder/view/widget/notificaiton/notification_count_badge.dart';
import 'package:genshin_reminder/view/widget/weapons/weapon_avater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TalentMaterialTile extends StatelessWidget {
  const TalentMaterialTile({
    required this.talentMaterialData,

    // required this.materialName,
    // required this.charactersList,
    // required this.weekName,
    Key? key,
  }) : super(key: key);

  // final String materialName;
  // final String weekName;
  // final List<Character> charactersList;

  final LevelUpMaterial talentMaterialData;
  @override
  Widget build(BuildContext context) {
    // final _l10n = AppLocalizations.of(context);

    return HookConsumer(builder: (context, ref, child) {
      final _model = ref.watch(characterScreenWidgetModelProvider);
      return InkWell(
        onTap: () async {
          _model.pushAddScreen(context, talentMaterialData);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // LvupMaterialAvater(
              //   showBadge: true,
              //   talentMaterialData: talentMaterialData,
              //   id: talentMaterialData.id,
              // ),
              Column(
                children: [
                  LvupMaterialAvater(
                    talentMaterialData: talentMaterialData,
                    id: talentMaterialData.id,
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
              if (talentMaterialData.materialTypeID ==
                  LevelUpMaterialType.character)
                Builder(builder: (context) {
                  final characters = CharactersList();
                  final charactersList =
                      characters.getCharacterList(talentMaterialData.id);
                  return Expanded(
                    // flex: 6,
                    child: CharacterAvatar(characters: charactersList),
                  );
                }),
              if (talentMaterialData.materialTypeID ==
                  LevelUpMaterialType.weapon)
                HookConsumer(builder: (context, ref, child) {
                  final selectFilter = ref.watch(weaponSelectProvider.state);
                  final weapons = WeaponList();
                  final List<Weapon> weaponsList;
                  if (selectFilter.state == 6) {
                    weaponsList = weapons.getWeaponList(talentMaterialData.id);
                  } else {
                    weaponsList = weapons
                        .getWeaponList(talentMaterialData.id)
                        .where(
                            (element) => element.category == selectFilter.state)
                        .toList();
                  }
                  return Expanded(
                    // flex: 6,
                    child: WeaponAvatar(weapons: weaponsList.toList()),
                  );
                }),
              // SizedBox(
              //   width: 50,
              //   height: 50,
              //   child: NotificationCountBadge(
              //     talentMaterialData: talentMaterialData,
              //     position: BadgePosition.topStart(top: -10, start: -2),
              //     // position: BadgePosition.topStart(top: -10),
              //     // BadgePosition.topEnd(top: -4, end: -1),
              //     child: const Icon(
              //       Icons.notifications,
              //       // size: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
