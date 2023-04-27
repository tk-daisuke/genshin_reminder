import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/view/character/character_material_all_screen.dart';
import 'package:genshin_reminder/view/sunday/sunday_screen.dart';
import 'package:genshin_reminder/view/widget/lvup_material_list_of_week.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterScreen extends HookWidget {
  const CharacterScreen({Key? key}) : super(key: key);
  static const String id = 'character_screen';

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    final _tabs = [
      const Tab(text: 'ALL'),
      Tab(text: _l10n?.mon_thu),
      Tab(text: _l10n?.tue_fri),
      Tab(text: _l10n?.wed_sat),
      Tab(
        text: _l10n?.sun,
      )
    ];
    final _characterMaterial = LevelUpMaterialList().talentLevelUpMaterials;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        // appBar:
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                title: Text(_l10n?.talent_level_up_material ?? '',
                    style: GoogleFonts.poppins()),
                bottom: TabBar(
                  tabs: _tabs,
                  indicatorColor: kSelectedBottomItemColor,
                  isScrollable: true,
                ),
              ),
            ];
          },
          body: TabBarView(children: [
            const CharacterMaterialAllScreen(),
            LvupMaterialListOfWeek(
              talentMaterialData1:
                  _characterMaterial[TalentMaterialIndexs.freedom],
              talentMaterialData2:
                  _characterMaterial[TalentMaterialIndexs.prosperity],
              talentMaterialData3:
                  _characterMaterial[TalentMaterialIndexs.transience],
            ),
            LvupMaterialListOfWeek(
              talentMaterialData1:
                  _characterMaterial[TalentMaterialIndexs.resistance],
              talentMaterialData2:
                  _characterMaterial[TalentMaterialIndexs.diligence],
              talentMaterialData3:
                  _characterMaterial[TalentMaterialIndexs.elegance],
            ),
            LvupMaterialListOfWeek(
              talentMaterialData1:
                  _characterMaterial[TalentMaterialIndexs.ballad],
              talentMaterialData2:
                  _characterMaterial[TalentMaterialIndexs.gold],
              talentMaterialData3:
                  _characterMaterial[TalentMaterialIndexs.light],
            ),
            const SundayScreen(lvupMaterialType: LevelUpMaterialType.character)
          ]),
        ),
      ),
    );
  }
}

// class CharacterMaterialOfWeeks extends StatelessWidget {
//   const CharacterMaterialOfWeeks({
//     Key? key,
//     required this.talentMaterialData1,
//     required this.talentMaterialData2,
//     required this.talentMaterialData3,
//   }) : super(key: key);

//   final LevelUpMaterial talentMaterialData1;

//   final LevelUpMaterial talentMaterialData2;
//   final LevelUpMaterial talentMaterialData3;

//   @override
//   Widget build(BuildContext context) {
//     final _l10n = AppLocalizations.of(context);
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const Divider(
//             color: ElementColors.wind,
//             thickness: 8,
//           ),
//           NationHeadLine(
//             from: _l10n?.mondstadt,
//             domain: _l10n?.forsaken_rift,
//             assetPath: 'assets/images/nations/mondstadt/icon.png',
//           ),
//           TalentMaterialTile(
//             talentMaterialData: talentMaterialData1,
//           ),
//           const Divider(
//             color: ElementColors.rock,
//             thickness: 8,
//           ),
//           NationHeadLine(
//             from: _l10n?.liyue,
//             domain: _l10n?.taishan_mansion,
//             assetPath: 'assets/images/nations/liyue/icon.png',
//           ),
//           TalentMaterialTile(
//             talentMaterialData: talentMaterialData2,
//           ),
//           const Divider(
//             color: ElementColors.elect,
//             thickness: 8,
//           ),
//           NationHeadLine(
//             from: _l10n?.inazuma,
//             domain: _l10n?.violet_court,
//             assetPath: 'assets/images/nations/inazuma/icon.png',
//           ),
//           TalentMaterialTile(
//             talentMaterialData: talentMaterialData3,
//           ),
//           Container(
//             height: 200,
//           ),
//         ],
//       ),
//     );
//   }
// }

// TabBarView(children: [
//           const CharacterMaterialAllScreen(),
//           SingleChildScrollView(
//             child: Column(),
//           ),
//           SingleChildScrollView(
//             child: Column(),
//           ),
//           SingleChildScrollView(
//             child: Column(),
//           )
//         ])
// AppBar(
//           title: Text(kAppName, style: GoogleFonts.poppins()),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 final _auth = AuthService(FirebaseAuth.instance);
//                 _auth.deleteUser(_auth.firebaseUser);
//               },
//               icon: const Icon(Icons.attribution_rounded),
//             ),
//           ],
//           bottom: TabBar(
//             tabs: _tabs,
//             indicatorColor: kSelectedBottomItemColor,
//           ),
//         ),