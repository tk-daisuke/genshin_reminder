import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/view/sunday/sunday_screen.dart';
import 'package:genshin_reminder/view/weapon/weapon_all_screen.dart';
import 'package:genshin_reminder/view/weapon/weapon_model.dart';
import 'package:genshin_reminder/view/widget/lvup_material_list_of_week.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeaponScreen extends HookWidget {
  const WeaponScreen({Key? key}) : super(key: key);
  static const String id = 'weapon_screen';

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    final _weaponMaterial = LevelUpMaterialList().weaponMaterials;

    final _tabs = [
      const Tab(text: 'ALL'),
      Tab(text: _l10n?.mon_thu),
      Tab(text: _l10n?.tue_fri),
      Tab(text: _l10n?.wed_sat),
      Tab(text: _l10n?.sun),
    ];

    // final _characterMaterial = LevelUpMaterialList().talentLevelUpMaterials;
    return DefaultTabController(
      length: _tabs.length,
      child: Container(
        color: Colors.grey[800],
        child: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  // floating: false,
                  // pinned: false,
                  title: Text(_l10n?.weapon_materials ?? '',
                      style: GoogleFonts.poppins()),
                  bottom: TabBar(
                    tabs: _tabs,
                    indicatorColor: kSelectedBottomItemColor,
                    isScrollable: true,
                  ),
                ),
              ];
            },
            body: Scaffold(
              appBar: AppBar(
                toolbarHeight: 57, backgroundColor: const Color(0xFF212332),
                // automaticallyImplyLeading: false,
                flexibleSpace: const _FilterBar2(),
              ),
              // AppBar(
              //   flexibleSpace: ,
              // ),
              body: TabBarView(children: [
                const WeaponAllScreen(),
                LvupMaterialListOfWeek(
                  talentMaterialData1:
                      _weaponMaterial[WeaponAscensionIndexs.decarabianTiles],
                  talentMaterialData2:
                      _weaponMaterial[WeaponAscensionIndexs.guyunPillars],
                  talentMaterialData3: _weaponMaterial[
                      WeaponAscensionIndexs.branchesofaDistantSea],
                ),
                LvupMaterialListOfWeek(
                  talentMaterialData1:
                      _weaponMaterial[WeaponAscensionIndexs.borealWolfTeeth],
                  talentMaterialData2:
                      _weaponMaterial[WeaponAscensionIndexs.elixirs],
                  talentMaterialData3:
                      _weaponMaterial[WeaponAscensionIndexs.narukamisMagatamas],
                ),
                LvupMaterialListOfWeek(
                  talentMaterialData1:
                      _weaponMaterial[WeaponAscensionIndexs.gladiatorShackle],
                  talentMaterialData2:
                      _weaponMaterial[WeaponAscensionIndexs.aerosiderite],
                  talentMaterialData3:
                      _weaponMaterial[WeaponAscensionIndexs.oniMasks],
                ),
                const SundayScreen(lvupMaterialType: LevelUpMaterialType.weapon)
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// class _FilterBar extends HookWidget {
//   const _FilterBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _l10n = AppLocalizations.of(context);

//     final chipTitles = <String>[
//       'ALL',
//       _l10n?.weapon_sword,
//       _l10n?.weapon_claymore,
//       _l10n?.weapon_polearm,
//       _l10n?.weapon_catalyst,
//       _l10n?.weapon_bow,
//     ];
//     final filter = useProvider(weaponFilterProvider);
//     final selectWeaponType = useProvider(weaponSelectProvider);
//     final _model = WeaponModel();
//     return SliverAppBar(
//         toolbarHeight: 50,
//         primary: false,
//         flexibleSpace: FlexibleSpaceBar(
//           background: ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: chipTitles.length,
//             separatorBuilder: (context, index) => const SizedBox(
//               width: 10,
//             ),
//             itemBuilder: (context, index) {
//               final selected = filter.state == index;
//               return Padding(
//                 padding: EdgeInsets.only(top: 2, left: index == 0 ? 10 : 0),
//                 child: ChoiceChip(
//                   selected: selected,
//                   selectedColor: Colors.white,
//                   disabledColor: Colors.black,
//                   label: Text(
//                     chipTitles[index],
//                     style: TextStyle(
//                         color: selected ? Colors.black : Colors.white),
//                   ),
//                   onSelected: (selected) {
//                     if (selected) {
//                       _model.selectFilter(index, selectWeaponType, filter);
//                     }
//                   },
//                 ),
//               );
//             },
//           ),
//         ));
//   }
// }

class _FilterBar2 extends HookConsumerWidget {
  const _FilterBar2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);

    final chipTitles = <String>[
      'ALL',
      _l10n?.weapon_sword ?? '',
      _l10n?.weapon_claymore ?? '',
      _l10n?.weapon_polearm ?? '',
      _l10n?.weapon_catalyst ?? '',
      _l10n?.weapon_bow ?? '',
    ];
    final filter = ref.watch(weaponFilterProvider.state);
    final selectWeaponType = ref.watch(weaponSelectProvider.state);
    final _model = WeaponModel();
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 1),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white30,
            width: 1,
          ),
          bottom: BorderSide(
            color: Colors.white30,
            width: 1,
          ),
        ),
      ),

      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: chipTitles.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final selecte = filter.state == index;
            return Padding(
              padding:
                  EdgeInsets.only(top: 2, left: index == 0 ? 10 : 0, right: 5),
              child: ChoiceChip(
                selected: selecte,
                selectedColor: Colors.white,
                disabledColor: Colors.black,
                label: Text(
                  chipTitles[index],
                  style:
                      TextStyle(color: selecte ? Colors.black : Colors.white),
                ),
                onSelected: (selected) {
                  if (selected) {
                    HapticFeedback.lightImpact();
                    // HapticFeedback.heavyImpact();
                    _model.selectFilter(index, selectWeaponType, filter);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
