import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/character/character_types.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/view/widget/character/character_screen_widget_model.dart';
import 'package:genshin_reminder/view/widget/nation_head_line.dart';
import 'package:genshin_reminder/view/widget/talent_material_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LvupMaterialListOfWeek extends StatelessWidget {
  const LvupMaterialListOfWeek({
    Key? key,
    required this.talentMaterialData1,
    required this.talentMaterialData2,
    required this.talentMaterialData3,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData1;

  final LevelUpMaterial talentMaterialData2;
  final LevelUpMaterial talentMaterialData3;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Divider(
            color: ElementColors.wind,
            thickness: 8,
          ),
          HookConsumer(builder: (context, ref, child) {
            final _model = ref.watch(characterScreenWidgetModelProvider);
            return NationHeadLine(
              from: _l10n?.mondstadt?? '',
              domain: _model.getDomainName(context, talentMaterialData1),
              assetPath: 'assets/images/nations/mondstadt/icon.png',
            );
          }),
          TalentMaterialTile(
            talentMaterialData: talentMaterialData1,
          ),
          const Divider(
            color: ElementColors.rock,
            thickness: 8,
          ),
          HookConsumer(builder: (context, ref, child) {
            final _model = ref.watch(characterScreenWidgetModelProvider);
            return NationHeadLine(
              from: _l10n?.liyue?? '',
              domain: _model.getDomainName(context, talentMaterialData2),
              assetPath: 'assets/images/nations/liyue/icon.png',
            );
          }),
          TalentMaterialTile(
            talentMaterialData: talentMaterialData2,
          ),
          const Divider(
            color: ElementColors.elect,
            thickness: 8,
          ),
          HookConsumer(builder: (context, ref, child) {
            final _model = ref.watch(characterScreenWidgetModelProvider);
            return NationHeadLine(
              from: _l10n?.inazuma?? '',
              domain: _model.getDomainName(context, talentMaterialData3),
              assetPath: 'assets/images/nations/inazuma/icon.png',
            );
          }),
          TalentMaterialTile(
            talentMaterialData: talentMaterialData3,
          ),
          Container(
            height: 200,
          ),
        ],
      ),
    );
  }
}
