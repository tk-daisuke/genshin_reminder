import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_model.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_screen.dart';
import 'package:genshin_reminder/view/widget/domain/domain_character.dart';
import 'package:genshin_reminder/view/widget/domain/domain_map.dart';
import 'package:genshin_reminder/view/widget/nation_head_line.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DomainInfo extends StatelessWidget {
  const DomainInfo({
    Key? key,
    required this.talentMaterialData,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HookConsumer(builder: (context, ref, child) {
          final _model = ref.watch(provideNotificationAdd.notifier);
          return NationHeadLine(
            from: _model.getWorldName(context, talentMaterialData),
            domain: _model.getDomainName(context, talentMaterialData),
            assetPath:
                'assets/images/nations/${talentMaterialData.worldID == WorldID.mondstadt ? 'mondstadt' : talentMaterialData.worldID == WorldID.liyue ? 'liyue' : talentMaterialData.worldID == WorldID.inazuma ? 'inazuma' : 'mondstadt'}/icon.png',
          );
        }),
        Image(
          image: AssetImage(
              'assets/images/domain/${talentMaterialData.domainID}/icon.png'),
        ),
        LvupMaterialDetail(talentMaterialData: talentMaterialData),
        DomainCharacterWeapon(talentMaterialData: talentMaterialData),
        DomainMap(
          talentMaterialData: talentMaterialData,
        ),
      ],
    );
  }
}
