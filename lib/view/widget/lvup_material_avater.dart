import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_list.dart';

class LvupMaterialAvater extends StatelessWidget {
  const LvupMaterialAvater({
    required this.talentMaterialData,
    // required this.week,
    Key? key,
    required this.id,
    this.onChip = true,
  }) : super(key: key);
  final LevelUpMaterial talentMaterialData;
  // final String week;
  final int id;
  final bool onChip;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final materials = LevelUpMaterialList();
    final materialName = materials.getLvUpMaterialName(context, id);
    final weekName = materials.getMaterialWeek(context, talentMaterialData);
    final isSunday = talentMaterialData.week1 == DateTime.sunday;
    return Container(
      constraints: const BoxConstraints(minWidth: 60, maxWidth: 100),
      width: _size.width * 0.15,
      child: _AssetImages(
        id: id,
        materialName: materialName,
        isSunday: isSunday,
        onChip: onChip,
        weekName: weekName,
        talentMaterialData: talentMaterialData,
      ),
    );
  }
}

class _AssetImages extends StatelessWidget {
  const _AssetImages({
    Key? key,
    required this.id,
    required this.materialName,
    required this.isSunday,
    required this.onChip,
    required this.weekName,
    required this.talentMaterialData,
  }) : super(key: key);

  final int id;
  final String materialName;
  final bool isSunday;
  final bool onChip;
  final String weekName;
  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 40, maxWidth: 80),
            child: Image(
              image: AssetImage('assets/images/material/$id.png'),
              // width: _size.width * 0.15,
            ),
          ),
          SizedBox(
            // height: 40,
            child: AutoSizeText(
              materialName,
              minFontSize: 5,
              textScaleFactor: 1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (!isSunday && onChip) weeksChip(weekName, Colors.black),
          // if (!isSunday && onChip)
          //   NotificationCountBadge(
          //     talentMaterialData: talentMaterialData,
          //     position: BadgePosition.topEnd(),
          //     // BadgePosition.topEnd(top: -4, end: -1),
          //     child:  const Icon(
          //       Icons.notifications,
          //       size: 20,
          //     ),
          //   ),
        ],
      ),
    );
  }
}

Widget weeksChip(String label, Color color) {
  return Chip(
    labelPadding: const EdgeInsets.all(1),
    // avatar: CircleAvatar(
    //   backgroundColor: Colors.white70,
    //   child: Text(label[0].toUpperCase()),
    // ),
    label: AutoSizeText(
      label,
      minFontSize: 8,
      textScaleFactor: 1,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6,
    shadowColor: Colors.grey[60],
    // padding: const EdgeInsets.all(8),
  );
}
