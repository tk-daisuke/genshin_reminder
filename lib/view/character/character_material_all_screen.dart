import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/character/character_types.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/widget/nation_head_line.dart';
import 'package:genshin_reminder/view/widget/talent_material_tile.dart';
import 'package:genshin_reminder/view/widget/talent_material_tile_sunday.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterMaterialAllScreen extends HookConsumerWidget {
  const CharacterMaterialAllScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);
    final _characterMaterial = LevelUpMaterialList().talentLevelUpMaterials;
    final sundaySettings =
        ref.watch(userSettingProvider.notifier).state.sundayActive;
    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(
            color: ElementColors.wind,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.mondstadt ?? '',
            domain: _l10n?.forsaken_rift ?? '',
            assetPath: 'assets/images/nations/mondstadt/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.freedom],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.resistance],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData: _characterMaterial[TalentMaterialIndexs.ballad],
          ),
          LvupMaterialSunday(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.forsakenRift],
            sundayActive: sundaySettings,
          ),
          const Divider(
            color: ElementColors.rock,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.liyue ?? '',
            domain: _l10n?.taishan_mansion ?? '',
            assetPath: 'assets/images/nations/liyue/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.prosperity],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.diligence],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData: _characterMaterial[TalentMaterialIndexs.gold],
          ),
          LvupMaterialSunday(
            sundayActive: sundaySettings,
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.taishanMansion],
          ),
          const Divider(
            color: ElementColors.elect,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.inazuma ?? '',
            domain: _l10n?.violet_court ?? '',
            assetPath: 'assets/images/nations/inazuma/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.transience],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.elegance],
          ),
          const Divider(),
          TalentMaterialTile(
            talentMaterialData: _characterMaterial[TalentMaterialIndexs.light],
          ),
          LvupMaterialSunday(
            sundayActive: sundaySettings,
            talentMaterialData:
                _characterMaterial[TalentMaterialIndexs.violetCourt],
          ),
          const Divider(
            color: Colors.white,
            thickness: 8,
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
