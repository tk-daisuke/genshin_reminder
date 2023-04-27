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

class WeaponAllScreen extends HookConsumerWidget {
  const WeaponAllScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);
    final _weaponMaterials = LevelUpMaterialList().weaponMaterials;

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
            domain: _l10n?.cecilia_garden ?? '',
            assetPath: 'assets/images/nations/mondstadt/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.decarabianTiles],
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.borealWolfTeeth],
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.gladiatorShackle],
          ),
          LvupMaterialSunday(
            sundayActive: sundaySettings,
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.ciliaGarden],
          ),
          const Divider(
            color: ElementColors.rock,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.liyue ?? '',
            domain: _l10n?.hiddenPalaceofLianshanFormula ?? '',
            assetPath: 'assets/images/nations/liyue/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.guyunPillars],
          ),
          TalentMaterialTile(
            talentMaterialData: _weaponMaterials[WeaponAscensionIndexs.elixirs],
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.aerosiderite],
          ),
          LvupMaterialSunday(
            sundayActive: sundaySettings,
            talentMaterialData: _weaponMaterials[
                WeaponAscensionIndexs.hiddenPalaceofLianshanFormula],
          ),
          const Divider(
            color: ElementColors.elect,
            thickness: 8,
          ),
          NationHeadLine(
            from: _l10n?.inazuma ?? '',
            domain: _l10n?.courtofFlowingSand ?? '',
            assetPath: 'assets/images/nations/inazuma/icon.png',
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.branchesofaDistantSea],
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.narukamisMagatamas],
          ),
          TalentMaterialTile(
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.oniMasks],
          ),
          LvupMaterialSunday(
            sundayActive: sundaySettings,
            talentMaterialData:
                _weaponMaterials[WeaponAscensionIndexs.courtofFlowingSand],
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
