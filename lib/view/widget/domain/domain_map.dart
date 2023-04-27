import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';

class DomainMap extends StatelessWidget {
  const DomainMap({
    Key? key,
    required this.talentMaterialData,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.location_on,
              ),
              Text(
                'Map',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textScaleFactor: 1,
              ),
            ],
          ),
        ),
        Image(
          // height: 150,
          image: AssetImage(
              'assets/images/domain/${talentMaterialData.domainID}/${_l10n?.map_file_name}'),
        ),
      ],
    );
  }
}
