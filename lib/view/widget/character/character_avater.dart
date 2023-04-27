import 'package:flutter/material.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/character/character.dart';
import 'package:genshin_reminder/item/character/character_types.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CharacterAvatar extends StatelessWidget {
  const CharacterAvatar({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    // static const int fire = 0;
    // static const int water = 1;
    // static const int elect = 2;
    // static const int ice = 3;
    // static const int wind = 4;
    // static const int rock = 5;
    // static const int dendro = 6;
    final _size = MediaQuery.of(context).size;
    final elementColor = [
      ElementColors.fire,
      ElementColors.water,
      ElementColors.elect,
      ElementColors.ice,
      ElementColors.wind,
      ElementColors.rock,
      ElementColors.dendro
    ];
    final _list = characters.map((list) {
      return Card(
        // elevation: 10,
        color: elementColor[list.element],
        child: Container(
          constraints: const BoxConstraints(
              minWidth: kImagesMinWidth, maxWidth: kImagesMaxWidth),
          child: HookConsumer(builder: (context, ref, child) {
            final imagesSetting =
                ref.watch(userSettingProvider.notifier).state.imagesSize;
            final isPlayerSora =
                ref.watch(userSettingProvider.notifier).state.travellerSora;
            final changeSora = isPlayerSora &&
                list.imagePath == 'assets/images/characters/traveler';

            return Image(
              image: changeSora
                  ? const AssetImage(
                      'assets/images/characters/traveler/icon2.png')
                  : AssetImage('${list.imagePath}/icon.png'),
              // height: 40,
              width:
                  imagesSetting == 45.11 ? _size.width * 0.11 : imagesSetting,
            );
          }),
        ),
      );
    }).toList();
    return Wrap(direction: Axis.horizontal, children: _list);
  }
}
