import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/character/character_types.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/view/widget/nation_head_line.dart';
import 'package:genshin_reminder/view/widget/talent_material_tile_sunday.dart';

class SundayScreen extends StatelessWidget {
  const SundayScreen({
    Key? key,
    required this.lvupMaterialType,
  }) : super(key: key);
  final int lvupMaterialType;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    final _characterMaterial = LevelUpMaterialList().talentLevelUpMaterials;
    final _weaponMaterials = LevelUpMaterialList().weaponMaterials;
    final type = lvupMaterialType == LevelUpMaterialType.character;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(
            color: ElementColors.wind,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.mondstadt ?? '',
            domain:
                type ? _l10n?.forsaken_rift ?? '' : _l10n?.cecilia_garden ?? '',
            assetPath: 'assets/images/nations/mondstadt/icon.png',
          ),
          if (lvupMaterialType == LevelUpMaterialType.character)
            LvupMaterialSunday(
              talentMaterialData:
                  _characterMaterial[TalentMaterialIndexs.forsakenRift],
            )
          else
            LvupMaterialSunday(
              talentMaterialData:
                  _weaponMaterials[WeaponAscensionIndexs.ciliaGarden],
            ),
          const Divider(
            color: ElementColors.rock,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.liyue ?? '',
            domain: type
                ? _l10n?.taishan_mansion ?? ''
                : _l10n?.hidden_palace_of_lianshan_formula ?? '',
            assetPath: 'assets/images/nations/liyue/icon.png',
          ),
          if (lvupMaterialType == LevelUpMaterialType.character)
            LvupMaterialSunday(
              talentMaterialData:
                  _characterMaterial[TalentMaterialIndexs.taishanMansion],
            )
          else
            LvupMaterialSunday(
              talentMaterialData: _weaponMaterials[
                  WeaponAscensionIndexs.hiddenPalaceofLianshanFormula],
            ),
          const Divider(
            color: ElementColors.elect,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.inazuma ?? '',
            domain: type
                ? _l10n?.violet_court ?? ''
                : _l10n?.court_of_flowing_sand ?? '',
            assetPath: 'assets/images/nations/inazuma/icon.png',
          ),
          if (lvupMaterialType == LevelUpMaterialType.character)
            LvupMaterialSunday(
              talentMaterialData:
                  _characterMaterial[TalentMaterialIndexs.violetCourt],
            )
          else
            LvupMaterialSunday(
              talentMaterialData:
                  _weaponMaterials[WeaponAscensionIndexs.courtofFlowingSand],
            ),
          Container(
            height: 200,
          ),
        ],
      ),
    );
  }
}

//  useProvider(providerNotificationList).when(
//             loading: () => const SizedBox(),
//             error: (e, stack) => Column(children: [
//               const Text('error'),
//               TextButton(
//                   onPressed: () => context.refresh(providerNotificationList),
//                   child: Text(_l10n?.reload))
//             ]),
//             data: (snapshot) {
//               final sortedSnapshot = snapshot
//                 ..sort((a, b) => a.id.compareTo(b.id));
//               final list = sortedSnapshot;
//               final item = list.map((doc) {
//                 return RefreshIndicator(
//                   onRefresh: () => context.refresh(providerNotificationList),
//                   child: Wrap(
//                     // mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       if (doc.id == 100)
//                         Text('${doc.id}タイトル：${doc.title}コメント：${doc.payload}')
//                       else
//                         Text('${doc.title}'),
//                       // Text('${doc.payload}'),
//                       // _button(name: '', onPressed: () {})
//                     ],
//                   ),
//                 );
//               }).toList();
//               return Column(
//                 children: item,
//               );
//             },
//           ),

// CircleAvatar(
//   child: Text('data'),
// ),
// ListTile(
//   title: _characters(
//     characters: material101,
//   ),
//   leading: _material(
//     materialID: _domain[0].mondayGift,
//     name: _l10n?.freedom_101,
//   ),
// ),
// InputChip(
//   label: Text('a'),
//   avatar: Image(
//     image: AssetImage('assets/images/characters/albedo/icon.png'),
//     height: 38,
//     width: 38,
//   ),
// ),

// final baseCharacterList = List<Character>.from(characters);
