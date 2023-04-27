import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/character/character.dart';
import 'package:genshin_reminder/item/character/characters_list.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/item/weapon/weapon.dart';
import 'package:genshin_reminder/item/weapon/weapon_list.dart';
import 'package:genshin_reminder/view/widget/character/character_avater.dart';
import 'package:genshin_reminder/view/widget/lvup_material_avater.dart';
import 'package:genshin_reminder/view/widget/weapons/weapon_avater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DomainCharacterWeapon extends StatelessWidget {
  const DomainCharacterWeapon({
    Key? key,
    required this.talentMaterialData,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.account_box,
              ),
              Text(
                talentMaterialData.materialTypeID ==
                        LevelUpMaterialType.character
                    ? 'Character'
                    : 'Weapon',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        HookConsumer(builder: (context, ref, child) {
          // final _model =
          //     useProvider(characterScreenWidgetModelProvider.notifier);
          final _size = MediaQuery.of(context).size;

          final isSunday = talentMaterialData.week1 == DateTime.sunday;
          if (isSunday) {
            return Column(
              children: [
                _SundayCharacterWeapons(
                  talentMaterialData: talentMaterialData,
                ),
              ],
            );
          } else {
            if (talentMaterialData.materialTypeID ==
                LevelUpMaterialType.character) {
              final items =
                  CharactersList().getCharacterList(talentMaterialData.id);

              return CharacterAvatar(characters: items);
            } else {
              final weapons = WeaponList().getWeaponList(talentMaterialData.id);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: _size.width / 20),
                child: WeaponAvatar(weapons: weapons),
              );
            }
          }
        }),
      ],
    );
  }
}

class _SundayCharacterWeapons extends StatelessWidget {
  const _SundayCharacterWeapons({
    Key? key,
    required this.talentMaterialData,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    final materials = LevelUpMaterialList();
    final charactersList = CharactersList();
    final weaponList = WeaponList();
    final charaOrWeapon = talentMaterialData.materialTypeID == 0;

    final materialName1 =
        materials.getLvUpMaterialName(context, talentMaterialData.id + 10);
    final materialName2 =
        materials.getLvUpMaterialName(context, talentMaterialData.id + 20);
    final materialName3 =
        materials.getLvUpMaterialName(context, talentMaterialData.id + 30);

    if (charaOrWeapon) {
      final items1 =
          charactersList.getCharacterList(talentMaterialData.id + 10);
      final items2 =
          charactersList.getCharacterList(talentMaterialData.id + 20);
      final items3 =
          charactersList.getCharacterList(talentMaterialData.id + 30);

      return Column(
        children: [
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName1,
            charaOrWeapon: charaOrWeapon,
            items: items1,
            weapons: const [],
            id: talentMaterialData.id + 10,
          ),
          const Divider(),
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName2,
            charaOrWeapon: charaOrWeapon,
            items: items2,
            weapons: const [],
            id: talentMaterialData.id + 20,
          ),
          const Divider(),
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName3,
            charaOrWeapon: charaOrWeapon,
            items: items3,
            weapons: const [],
            id: talentMaterialData.id + 30,
          ),
        ],
      );
    } else {
      final weapon1 = weaponList.getWeaponList(talentMaterialData.id + 10);
      final weapon2 = weaponList.getWeaponList(talentMaterialData.id + 20);
      final weapon3 = weaponList.getWeaponList(talentMaterialData.id + 30);

      return Column(
        children: [
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName1,
            charaOrWeapon: charaOrWeapon,
            items: const [],
            weapons: weapon1,
            id: talentMaterialData.id + 10,
          ),
          const Divider(),
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName2,
            charaOrWeapon: charaOrWeapon,
            items: const [],
            weapons: weapon2,
            id: talentMaterialData.id + 20,
          ),
          const Divider(),
          _SundayCharactersTile(
            talentMaterialData: talentMaterialData,
            materialName: materialName3,
            charaOrWeapon: charaOrWeapon,
            items: const [],
            weapons: weapon3,
            id: talentMaterialData.id + 30,
          ),
        ],
      );
    }
  }
}

class _SundayCharactersTile extends StatelessWidget {
  const _SundayCharactersTile(
      {Key? key,
      required this.talentMaterialData,
      required this.materialName,
      required this.charaOrWeapon,
      required this.items,
      required this.weapons,
      required this.id})
      : super(key: key);

  final LevelUpMaterial talentMaterialData;
  final String materialName;
  final bool charaOrWeapon;
  final List<Character> items;
  final List<Weapon> weapons;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: LvupMaterialAvater(
            // id: talentMaterialData.id + 20,
            // name: materialName,
            // week: '',
            talentMaterialData: talentMaterialData, id: id,
          ),
        ),
        Expanded(
            flex: 4,
            child: charaOrWeapon
                ? CharacterAvatar(characters: items)
                : WeaponAvatar(weapons: weapons)),
      ],
    );
  }
}
