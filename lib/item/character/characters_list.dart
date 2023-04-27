import 'package:genshin_reminder/item/character/character.dart';
import 'package:genshin_reminder/item/character/character_types.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';

const String imagePath = 'assets/images/characters/';

class CharactersList {
  static final basedCharacterList = List<Character>.from(characters);
  final material110 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.freedom ||
          character.gift == TalentMaterials.travelerAnemo ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material120 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.resistance ||
          character.gift == TalentMaterials.travelerAnemo ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material130 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.ballad ||
          character.gift == TalentMaterials.travelerAnemo ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));
  final material100 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.ballad ||
          character.gift == TalentMaterials.resistance ||
          character.gift == TalentMaterials.freedom ||
          character.gift == TalentMaterials.travelerAnemo ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material210 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.prosperity ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material220 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.diligence ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material230 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.gold ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));
  final material200 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.prosperity ||
          character.gift == TalentMaterials.diligence ||
          character.gift == TalentMaterials.gold ||
          character.gift == TalentMaterials.travelerGeo)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));
  final material310 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.transience ||
          character.gift == TalentMaterials.travelerElect)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material320 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.elegance ||
          character.gift == TalentMaterials.travelerElect)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  final material330 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.light ||
          character.gift == TalentMaterials.travelerElect)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));
  final material300 = basedCharacterList
      .where((Character character) =>
          character.gift == TalentMaterials.light ||
          character.gift == TalentMaterials.elegance ||
          character.gift == TalentMaterials.transience ||
          character.gift == TalentMaterials.travelerElect)
      .toList()
    ..sort((a, b) => a.element.compareTo(b.element));

  List<Character> getCharacterList(int materialID) {
    if (materialID == TalentMaterials.forsakenRift) {
      return CharactersList().material100;
    } else if (materialID == TalentMaterials.freedom) {
      return CharactersList().material110;
    } else if (materialID == TalentMaterials.resistance) {
      return CharactersList().material120;
    } else if (materialID == TalentMaterials.ballad) {
      return CharactersList().material130;
    } else if (materialID == TalentMaterials.taishanMansion) {
      return CharactersList().material200;
    } else if (materialID == TalentMaterials.prosperity) {
      return CharactersList().material210;
    } else if (materialID == TalentMaterials.diligence) {
      return CharactersList().material220;
    } else if (materialID == TalentMaterials.gold) {
      return CharactersList().material230;
    } else if (materialID == TalentMaterials.violetCourt) {
      return CharactersList().material300;
    } else if (materialID == TalentMaterials.transience) {
      return CharactersList().material310;
    } else if (materialID == TalentMaterials.elegance) {
      return CharactersList().material320;
    } else if (materialID == TalentMaterials.light) {
      return CharactersList().material330;
    } else {
      return CharactersList().material330;
    }
  }
}

// List<Character> getCharacterList(int materialID) {
//   if (materialID == TalentMaterials.forsakenRift) {
//     return CharactersList().material100;
//   } else if (materialID == TalentMaterials.freedom) {
//     return CharactersList().material110;
//   } else if (materialID == TalentMaterials.resistance) {
//     return CharactersList().material120;
//   } else if (materialID == TalentMaterials.ballad) {
//     return CharactersList().material130;
//   } else if (materialID == TalentMaterials.taishanMansion) {
//     return CharactersList().material200;
//   } else if (materialID == TalentMaterials.prosperity) {
//     return CharactersList().material210;
//   } else if (materialID == TalentMaterials.diligence) {
//     return CharactersList().material220;
//   } else if (materialID == TalentMaterials.gold) {
//     return CharactersList().material230;
//   } else if (materialID == TalentMaterials.violetCourt) {
//     return CharactersList().material300;
//   } else if (materialID == TalentMaterials.transience) {
//     return CharactersList().material310;
//   } else if (materialID == TalentMaterials.elegance) {
//     return CharactersList().material320;
//   } else if (materialID == TalentMaterials.light) {
//     return CharactersList().material330;
//   } else {
//     return CharactersList().material330;
//   }
// }

const List<Character> characters = [
  Character(
      id: 0,
      element: Element.rock,
      imagePath: 'assets/images/characters/albedo',
      name: 'albedo',
      gift: TalentMaterials.ballad),
  Character(
      id: 1,
      element: Element.fire,
      imagePath: 'assets/images/characters/amber',
      name: 'amber',
      gift: TalentMaterials.freedom),
  Character(
      id: 2,
      element: Element.ice,
      imagePath: 'assets/images/characters/ayaka',
      name: 'ayaka',
      gift: TalentMaterials.elegance),
  Character(
      id: 3,
      element: Element.water,
      imagePath: 'assets/images/characters/barbara',
      name: 'barbara',
      gift: TalentMaterials.freedom),
  Character(
      id: 4,
      element: Element.elect,
      imagePath: 'assets/images/characters/beidou',
      name: 'beidou',
      gift: TalentMaterials.gold),
  Character(
      id: 5,
      element: Element.fire,
      imagePath: 'assets/images/characters/bennett',
      name: 'bennett',
      gift: TalentMaterials.resistance),
  Character(
      id: 6,
      element: Element.ice,
      imagePath: 'assets/images/characters/chongyun',
      name: 'chongyun',
      gift: TalentMaterials.diligence),
  Character(
      id: 7,
      element: Element.fire,
      imagePath: 'assets/images/characters/diluc',
      name: 'diluc',
      gift: TalentMaterials.resistance),
  Character(
      id: 8,
      element: Element.ice,
      imagePath: 'assets/images/characters/diona',
      name: 'diona',
      gift: TalentMaterials.freedom),
  Character(
      id: 9,
      element: Element.ice,
      imagePath: 'assets/images/characters/eula',
      name: 'eula',
      gift: TalentMaterials.resistance),
  Character(
      id: 10,
      element: Element.elect,
      imagePath: 'assets/images/characters/fischl',
      name: 'fischl',
      gift: TalentMaterials.ballad),
  Character(
      id: 11,
      element: Element.ice,
      imagePath: 'assets/images/characters/ganyu',
      name: 'ganyu',
      gift: TalentMaterials.diligence),
  Character(
      id: 12,
      element: Element.fire,
      imagePath: 'assets/images/characters/hu-tao',
      name: 'hu-tao',
      gift: TalentMaterials.diligence),
  Character(
      id: 13,
      element: Element.wind,
      imagePath: 'assets/images/characters/jean',
      name: 'jean',
      gift: TalentMaterials.resistance),
  Character(
      id: 14,
      element: Element.wind,
      imagePath: 'assets/images/characters/kazuha',
      name: 'kazuha',
      gift: TalentMaterials.diligence),
  Character(
      id: 15,
      element: Element.elect,
      imagePath: 'assets/images/characters/keqing',
      name: 'keqing',
      gift: TalentMaterials.prosperity),
  Character(
      id: 16,
      element: Element.fire,
      imagePath: 'assets/images/characters/klee',
      name: 'klee',
      gift: TalentMaterials.freedom),
  Character(
      id: 17,
      element: Element.elect,
      imagePath: 'assets/images/characters/lisa',
      name: 'lisa',
      gift: TalentMaterials.ballad),
  Character(
      id: 18,
      element: Element.water,
      imagePath: 'assets/images/characters/mona',
      name: 'mona',
      gift: TalentMaterials.resistance),
  Character(
      id: 19,
      element: Element.rock,
      imagePath: 'assets/images/characters/ningguang',
      name: 'ningguang',
      gift: TalentMaterials.prosperity),
  Character(
      id: 20,
      element: Element.rock,
      imagePath: 'assets/images/characters/noelle',
      name: 'noelle',
      gift: TalentMaterials.resistance),
  Character(
      id: 21,
      element: Element.ice,
      imagePath: 'assets/images/characters/qiqi',
      name: 'qiqi',
      gift: TalentMaterials.prosperity),
  Character(
      id: 22,
      element: Element.elect,
      imagePath: 'assets/images/characters/razor',
      name: 'razor',
      gift: TalentMaterials.resistance),
  Character(
      id: 23,
      element: Element.ice,
      imagePath: 'assets/images/characters/rosaria',
      name: 'rosaria',
      gift: TalentMaterials.ballad),
  Character(
      id: 24,
      element: Element.wind,
      imagePath: 'assets/images/characters/sucrose',
      name: 'sucrose',
      gift: TalentMaterials.freedom),
  Character(
      id: 25,
      element: Element.water,
      imagePath: 'assets/images/characters/tartaglia',
      name: 'tartaglia',
      gift: TalentMaterials.freedom),
  Character(
      id: 26,
      element: Element.wind,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-anemo',
      gift: TalentMaterials.travelerAnemo),
  Character(
      id: 27,
      element: Element.rock,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-geo',
      gift: TalentMaterials.travelerGeo),
  Character(
      id: 28,
      element: Element.elect,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-elect',
      gift: TalentMaterials.travelerElect),
  Character(
      id: 29,
      element: Element.dendro,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-dendro',
      gift: TalentMaterials.travelerDendro),
  Character(
      id: 30,
      element: Element.water,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-water',
      gift: TalentMaterials.travelerWater),
  Character(
      id: 31,
      element: Element.fire,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-fire',
      gift: TalentMaterials.travelerFire),
  Character(
      id: 32,
      element: Element.ice,
      imagePath: 'assets/images/characters/traveler',
      name: 'traveler-ice',
      gift: TalentMaterials.travelerIce),
  Character(
      id: 33,
      element: Element.wind,
      imagePath: 'assets/images/characters/venti',
      name: 'venti',
      gift: TalentMaterials.ballad),
  Character(
      id: 34,
      element: Element.fire,
      imagePath: 'assets/images/characters/xiangling',
      name: 'xiangling',
      gift: TalentMaterials.diligence),
  Character(
      id: 35,
      element: Element.wind,
      imagePath: 'assets/images/characters/xiao',
      name: 'xiao',
      gift: TalentMaterials.prosperity),
  Character(
      id: 36,
      element: Element.water,
      imagePath: 'assets/images/characters/xingqiu',
      name: 'xingqiu',
      gift: TalentMaterials.gold),
  Character(
      id: 37,
      element: Element.fire,
      imagePath: 'assets/images/characters/xinyan',
      name: 'xinyan',
      gift: TalentMaterials.gold),
  Character(
      id: 38,
      element: Element.fire,
      imagePath: 'assets/images/characters/yanfei',
      name: 'yanfei',
      gift: TalentMaterials.gold),
  Character(
      id: 39,
      element: Element.rock,
      imagePath: 'assets/images/characters/zhongli',
      name: 'zhongli',
      gift: TalentMaterials.gold),
  Character(
      id: 40,
      element: Element.fire,
      imagePath: 'assets/images/characters/yoimiya',
      name: 'yoimiya',
      gift: TalentMaterials.transience),
  Character(
      id: 41,
      element: Element.wind,
      imagePath: 'assets/images/characters/sayu',
      name: 'sayu',
      gift: TalentMaterials.light),
  Character(
      id: 42,
      element: Element.ice,
      imagePath: 'assets/images/characters/kaeya',
      name: 'kaeya',
      gift: TalentMaterials.ballad),
  Character(
      id: 43,
      element: Element.elect,
      imagePath: 'assets/images/characters/raiden-shogun',
      name: 'RaidenShogun',
      gift: TalentMaterials.light),
  Character(
      id: 44,
      element: Element.elect,
      imagePath: 'assets/images/characters/kujou-sara',
      name: 'kujou_sara',
      gift: TalentMaterials.elegance),
  Character(
      id: 45,
      element: Element.ice,
      imagePath: 'assets/images/characters/aloy',
      name: 'aloy',
      gift: TalentMaterials.freedom),
  Character(
      id: 46,
      element: Element.water,
      imagePath: 'assets/images/characters/sangonomiya-kokomi',
      name: 'sangonomiya-kokomi',
      gift: TalentMaterials.transience),
  Character(
      id: 47,
      element: Element.fire,
      imagePath: 'assets/images/characters/thoma',
      name: 'thoma',
      gift: TalentMaterials.transience),
  Character(
      id: 48,
      element: Element.rock,
      imagePath: 'assets/images/characters/arataki_itto',
      name: 'arataki_itto',
      gift: TalentMaterials.elegance),
  Character(
      id: 49,
      element: Element.rock,
      imagePath: 'assets/images/characters/gorou',
      name: 'gorou',
      gift: TalentMaterials.light),
  Character(
      id: 50,
      element: Element.ice,
      imagePath: 'assets/images/characters/shenhe',
      name: 'Shenhe',
      gift: TalentMaterials.prosperity),
  Character(
      id: 51,
      element: Element.rock,
      imagePath: 'assets/images/characters/yun-jin',
      name: 'YunJin',
      gift: TalentMaterials.diligence),
  Character(
      id: 52,
      element: Element.elect,
      imagePath: 'assets/images/characters/yaemiko',
      name: 'Yae Miko',
      gift: TalentMaterials.light),
  Character(
      id: 53,
      element: Element.water,
      imagePath: 'assets/images/characters/ayato',
      name: 'ayato',
      gift: TalentMaterials.elegance),
  Character(
      id: 54,
      element: Element.water,
      imagePath: 'assets/images/characters/yelan',
      name: 'yelan',
      gift: TalentMaterials.prosperity),
];


        // static const example= Character(
        // element: Element.,
        // imagePath: '${imagePath}albedo/icon.jpg',
        // name: 'albedo'),

  // static const albedo = Character(
  //     id: 1,
  //     element: Element.fire,
  //     imagePath: '${imagePath}albedo/icon.jpg',
  //     name: 'albedo', gif_id: 100);
