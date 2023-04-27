import 'package:flutter/material.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/weapon/weapon.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeaponAvatar extends StatelessWidget {
  const WeaponAvatar({
    Key? key,
    required this.weapons,
  }) : super(key: key);

  final List<Weapon> weapons;

  @override
  Widget build(BuildContext context) {
    final _list = weapons.map((list) {
      if (list.rarity == 5) {
        return _RarityCard(
          path: list.imagePath,
          color1: const Color(0xffA09491),
          color2: const Color(0xffDAA353),
        );
      } else if (list.rarity == 4) {
        return _RarityCard(
          path: list.imagePath,
          color1: const Color(0xff68588C),
          color2: const Color(0xffB182C3),
        );
      } else {
        // 使わないnull safety
        return Card(
          elevation: 10,
          color: Colors.amber,
          child: Image(
            image: AssetImage(list.imagePath),
            height: 50,
            width: 50,
          ),
        );
      }
    }).toList();
    return Wrap(direction: Axis.horizontal, children: _list);
  }
}

class _RarityCard extends StatelessWidget {
  const _RarityCard({
    Key? key,
    required this.color1,
    required this.color2,
    required this.path,
  }) : super(key: key);
  final Color color1;
  final Color color2;
  final String path;
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(4),
      constraints: const BoxConstraints(
          minWidth: kImagesMinWidth, maxWidth: kImagesMaxWidth),
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(
              0.8, 0), // 10% of the width, so there are ten blinds.
          colors: <Color>[
            color1,
            color2,
          ],
          tileMode: TileMode.clamp,
        ),
      ),
      child: HookConsumer(builder: (context, ref, child) {
        final imagesSetting = ref.watch(userSettingProvider.notifier);
        return Image(
          image: AssetImage(path),
          // height: 50,

          width: imagesSetting.state.imagesSize == 45.11
              ? _size.width * 0.11
              : imagesSetting.state.imagesSize,
        );
      }),
    );
  }
}
