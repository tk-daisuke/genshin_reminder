import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/item/weapon/weapon.dart';

class WeaponList {
  WeaponList() : weaponlist = basedWeaponList;
  List<Weapon> weaponlist;
  static List<Weapon> get basedWeaponList => weaponSort();

  // static

//
  static List<Weapon> weaponSort() {
    final weaponList = List<Weapon>.from(weapons)
      ..sort((a, b) => a.category.compareTo(b.category));
    final sword = getWeapon(weaponList, 0);
    final claymore = getWeapon(weaponList, 1);
    final polearm = getWeapon(weaponList, 2);
    final catalyst = getWeapon(weaponList, 3);
    final bow = getWeapon(weaponList, 4);
    final list = <Weapon>[
      ...sword,
      ...claymore,
      ...polearm,
      ...catalyst,
      ...bow
    ];
    return list;
  }

  static List<Weapon> getWeapon(List<Weapon> list, int id) {
    final weapon = list.where((element) => element.category == id).toList()
      ..sort((a, b) => b.rarity.compareTo(a.rarity));
    return weapon;
  }

  final material20110 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.decarabianTiles)
      .toList();
  final material20120 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.borealWolfTeeth)
      .toList();
  final material20130 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.gladiatorShackle)
      .toList();
  final material20210 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.guyunPillars)
      .toList();
  final material20220 = basedWeaponList
      .where((Weapon weapon) => weapon.gift == WeaponAscensionMaterials.elixirs)
      .toList();
  final material20230 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.aerosiderite)
      .toList();
  final material20310 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.branchesofaDistantSea)
      .toList();
  final material20320 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.narukamisMagatamas)
      .toList();
  final material20330 = basedWeaponList
      .where(
          (Weapon weapon) => weapon.gift == WeaponAscensionMaterials.oniMasks)
      .toList();

  final material20100 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.decarabianTiles ||
          weapon.gift == WeaponAscensionMaterials.borealWolfTeeth ||
          weapon.gift == WeaponAscensionMaterials.gladiatorShackle)
      .toList();
  final material20200 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.guyunPillars ||
          weapon.gift == WeaponAscensionMaterials.elixirs ||
          weapon.gift == WeaponAscensionMaterials.aerosiderite)
      .toList();
  final material20300 = basedWeaponList
      .where((Weapon weapon) =>
          weapon.gift == WeaponAscensionMaterials.oniMasks ||
          weapon.gift == WeaponAscensionMaterials.narukamisMagatamas ||
          weapon.gift == WeaponAscensionMaterials.branchesofaDistantSea)
      .toList();
  List<Weapon> getWeaponList(int materialID) {
    if (materialID == WeaponAscensionMaterials.decarabianTiles) {
      return WeaponList().material20110;
    } else if (materialID == WeaponAscensionMaterials.borealWolfTeeth) {
      return WeaponList().material20120;
    } else if (materialID == WeaponAscensionMaterials.gladiatorShackle) {
      return WeaponList().material20130;
    } else if (materialID == WeaponAscensionMaterials.guyunPillars) {
      return WeaponList().material20210;
    } else if (materialID == WeaponAscensionMaterials.elixirs) {
      return WeaponList().material20220;
    } else if (materialID == WeaponAscensionMaterials.aerosiderite) {
      return WeaponList().material20230;
    } else if (materialID == WeaponAscensionMaterials.branchesofaDistantSea) {
      return WeaponList().material20310;
    } else if (materialID == WeaponAscensionMaterials.narukamisMagatamas) {
      return WeaponList().material20320;
    } else if (materialID == WeaponAscensionMaterials.oniMasks) {
      return WeaponList().material20330;
    } else if (materialID == WeaponAscensionMaterials.ciliaGarden) {
      return WeaponList().material20100;
    } else if (materialID ==
        WeaponAscensionMaterials.hiddenPalaceofLianshanFormula) {
      return WeaponList().material20200;
    } else if (materialID == WeaponAscensionMaterials.courtofFlowingSand) {
      return WeaponList().material20300;
    } else {
      return WeaponList().material20330;
    }
  }
}

const List<Weapon> weapons = [
  Weapon(
    id: 0,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/0.png',
    name: 'aquila-favonia',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 0,
  ),
  Weapon(
    id: 1,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/1.png',
    name: 'blackcliff-longsword',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 0,
  ),
  Weapon(
    id: 2,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/2.png',
    name: 'favonius-sword',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 0,
  ),
  Weapon(
    id: 3,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/3.png',
    name: 'festering-desire',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 0,
  ),
  Weapon(
    id: 4,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/4.png',
    name: 'iron-sting',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 0,
  ),
  Weapon(
    id: 5,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/5.png',
    name: 'lion-s-roar',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 0,
  ),
  Weapon(
    id: 6,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/6.png',
    name: 'prototype-rancour',
    gift: WeaponAscensionMaterials.elixirs,
    category: 0,
  ),
  Weapon(
    id: 7,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/7.png',
    name: 'royal-longsword',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 0,
  ),
  Weapon(
    id: 8,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/8.png',
    name: 'sacrificial-sword',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 0,
  ),
  Weapon(
    id: 9,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/9.png',
    name: 'skyward-blade',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 0,
  ),
  Weapon(
    id: 10,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/10.png',
    name: 'summit-shaper',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 0,
  ),
  Weapon(
    id: 11,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/11.png',
    name: 'the-alley-flash',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 0,
  ),
  Weapon(
    id: 12,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/12.png',
    name: 'the-black-sword',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 0,
  ),
  Weapon(
    id: 13,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/13.png',
    name: 'the-flute',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 0,
  ),
  Weapon(
    id: 14,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/14.png',
    name: 'blackcliff-slasher',
    gift: WeaponAscensionMaterials.elixirs,
    category: 1,
  ),
  Weapon(
    id: 15,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/15.png',
    name: 'favonius-greatsword',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 1,
  ),
  Weapon(
    id: 16,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/16.png',
    name: 'lithic-blade',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 1,
  ),
  Weapon(
    id: 17,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/17.png',
    name: 'prototype-aminus',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 1,
  ),
  Weapon(
    id: 19,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/19.png',
    name: 'rainslasher',
    gift: WeaponAscensionMaterials.elixirs,
    category: 1,
  ),
  Weapon(
    id: 20,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/20.png',
    name: 'royal-greatsword',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 1,
  ),
  Weapon(
    id: 21,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/21.png',
    name: 'sacrificial-greatsword',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 1,
  ),
  Weapon(
    id: 22,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/22.png',
    name: 'serpent-spine',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 1,
  ),
  Weapon(
    id: 23,
    rarity: 5,
    imagePath: 'assets/images/weapons/claymores/23.png',
    name: 'skyward-pride',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 1,
  ),
  Weapon(
    id: 24,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/24.png',
    name: 'snow-tombed-starsilver',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 1,
  ),
  Weapon(
    id: 25,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/25.png',
    name: 'the-bell',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 1,
  ),
  Weapon(
    id: 26,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/26.png',
    name: 'whiteblind',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 1,
  ),
  Weapon(
    id: 27,
    rarity: 5,
    imagePath: 'assets/images/weapons/claymores/27.png',
    name: 'wolf-s-gravestone',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 1,
  ),
  Weapon(
    id: 28,
    rarity: 5,
    imagePath: 'assets/images/weapons/claymores/28.png',
    name: 'SongofBrokenPines',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 1,
  ),
  Weapon(
    id: 29,
    rarity: 5,
    imagePath: 'assets/images/weapons/claymores/29.png',
    name: 'TheUnforged',
    gift: WeaponAscensionMaterials.elixirs,
    category: 1,
  ),
  Weapon(
    id: 30,
    rarity: 4,
    imagePath: 'assets/images/weapons/claymores/30.png',
    name: 'KatsuragikiriNagamasa',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 1,
  ),
  Weapon(
    id: 31,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/31.png',
    name: 'blackcliff-pole',
    gift: WeaponAscensionMaterials.elixirs,
    category: 2,
  ),
  Weapon(
    id: 32,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/32.png',
    name: 'crescent-pike',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 2,
  ),
  Weapon(
    id: 33,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/33.png',
    name: 'deathmatch',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 2,
  ),
  Weapon(
    id: 34,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/34.png',
    name: 'dragon-s-bane',
    gift: WeaponAscensionMaterials.elixirs,
    category: 2,
  ),
  Weapon(
    id: 35,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/35.png',
    name: 'dragonspine-spear',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 2,
  ),
  Weapon(
    id: 36,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/36.png',
    name: 'favonius-lance',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 2,
  ),
  Weapon(
    id: 37,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/37.png',
    name: 'vortex-vanquisher',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 2,
  ),
  Weapon(
    id: 38,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/38.png',
    name: 'lithic-spear',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 2,
  ),
  Weapon(
    id: 39,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/39.png',
    name: 'primordial-jade-winged-spear',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 2,
  ),
  Weapon(
    id: 40,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/40.png',
    name: 'prototype-starglitter',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 2,
  ),
  Weapon(
    id: 41,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/41.png',
    name: 'skyward-spine',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 2,
  ),
  Weapon(
    id: 42,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/42.png',
    name: 'staff-of-homa',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 2,
  ),
  Weapon(
    id: 43,
    rarity: 5,
    imagePath: 'assets/images/weapons/bows/43.png',
    name: 'amos-bow',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 3,
  ),
  Weapon(
    id: 44,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/44.png',
    name: 'blackcliff-warbow',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 3,
  ),
  Weapon(
    id: 45,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/45.png',
    name: 'compound-bow',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 3,
  ),
  Weapon(
    id: 46,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/46.png',
    name: 'favonius-warbow',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 3,
  ),
  Weapon(
    id: 47,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/47.png',
    name: 'prototype-crescent',
    gift: WeaponAscensionMaterials.elixirs,
    category: 3,
  ),
  Weapon(
    id: 48,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/48.png',
    name: 'royal-bow',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 3,
  ),
  Weapon(
    id: 49,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/49.png',
    name: 'rust',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 3,
  ),
  Weapon(
    id: 50,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/50.png',
    name: 'sacrificial-bow',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 3,
  ),
  Weapon(
    id: 51,
    rarity: 5,
    imagePath: 'assets/images/weapons/bows/51.png',
    name: 'skyward-harp',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 3,
  ),
  Weapon(
    id: 52,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/52.png',
    name: 'the-stringless',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 3,
  ),
  Weapon(
    id: 53,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/53.png',
    name: 'the-viridescent-hunt',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 3,
  ),
  Weapon(
    id: 54,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/54.png',
    name: 'DodocoTales',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 4,
  ),
  Weapon(
    id: 55,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/55.png',
    name: 'blackcliff-agate',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 4,
  ),
  Weapon(
    id: 56,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/56.png',
    name: 'eye-of-perception',
    gift: WeaponAscensionMaterials.elixirs,
    category: 4,
  ),
  Weapon(
    id: 57,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/57.png',
    name: 'favonius-codex',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 4,
  ),
  Weapon(
    id: 58,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/58.png',
    name: 'frostbearer',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 4,
  ),
  Weapon(
    id: 59,
    rarity: 5,
    imagePath: 'assets/images/weapons/catalysts/59.png',
    name: 'lost-prayer-to-the-sacred-winds',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 4,
  ),
  Weapon(
    id: 60,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/60.png',
    name: 'mappa-mare',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 4,
  ),
  Weapon(
    id: 61,
    rarity: 5,
    imagePath: 'assets/images/weapons/catalysts/61.png',
    name: 'memory-of-dust',
    gift: WeaponAscensionMaterials.aerosiderite,
    category: 4,
  ),
  Weapon(
    id: 62,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/62.png',
    name: 'prototype-amber',
    gift: WeaponAscensionMaterials.elixirs,
    category: 4,
  ),
  Weapon(
    id: 63,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/63.png',
    name: 'royal-grimoire',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 4,
  ),
  Weapon(
    id: 64,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/64.png',
    name: 'sacrificial-fragments',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 4,
  ),
  Weapon(
    id: 65,
    rarity: 5,
    imagePath: 'assets/images/weapons/catalysts/65.png',
    name: 'skyward-atlas',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 4,
  ),
  Weapon(
    id: 66,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/66.png',
    name: 'solar-pearl',
    gift: WeaponAscensionMaterials.guyunPillars,
    category: 4,
  ),
  Weapon(
    id: 67,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/67.png',
    name: 'the-widsith',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 4,
  ),
  Weapon(
    id: 68,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/68.png',
    name: 'wine-and-song',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 4,
  ),
  Weapon(
    id: 69,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/69.png',
    name: 'EngulfingLightning',
    gift: WeaponAscensionMaterials.oniMasks,
    category: 2,
  ),
  Weapon(
    id: 70,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/70.png',
    name: 'TheCatch',
    gift: WeaponAscensionMaterials.oniMasks,
    category: 2,
  ),
  Weapon(
    id: 71,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/71.png',
    name: 'KitainCrossSpear',
    gift: WeaponAscensionMaterials.oniMasks,
    category: 2,
  ),
  Weapon(
    id: 72,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/72.png',
    name: 'RoyalSpear',
    gift: WeaponAscensionMaterials.elixirs,
    category: 2,
  ),
  Weapon(
    id: 73,
    rarity: 5,
    imagePath: 'assets/images/weapons/bows/73.png',
    name: 'ThunderingPulse',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 3,
  ),
  Weapon(
    id: 74,
    rarity: 5,
    imagePath: 'assets/images/weapons/bows/74.png',
    name: 'ElegyfortheEnd',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 3,
  ),
  Weapon(
    id: 75,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/75.png',
    name: 'Hamayumi',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 3,
  ),
  Weapon(
    id: 76,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/76.png',
    name: 'MitternachtsWaltz',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 3,
  ),
  Weapon(
    id: 77,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/77.png',
    name: 'WindblumeOde',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 3,
  ),
  Weapon(
    id: 78,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/78.png',
    name: 'AlleyHunter',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 3,
  ),
  Weapon(
    id: 79,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/79.png',
    name: 'AmenomaKageuchi',
    gift: WeaponAscensionMaterials.branchesofaDistantSea,
    category: 0,
  ),
  Weapon(
    id: 80,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/80.png',
    name: 'Freedom-Sword',
    gift: WeaponAscensionMaterials.gladiatorShackle,
    category: 0,
  ),
  Weapon(
    id: 81,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/81.png',
    name: 'MistsplitterReforged',
    gift: WeaponAscensionMaterials.branchesofaDistantSea,
    category: 0,
  ),
  Weapon(
    id: 82,
    rarity: 5,
    imagePath: 'assets/images/weapons/swords/82.png',
    name: 'PrimordialJadeCutter',
    gift: WeaponAscensionMaterials.elixirs,
    category: 0,
  ),
  Weapon(
    id: 83,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/83.png',
    name: 'SwordofDescension',
    gift: WeaponAscensionMaterials.borealWolfTeeth,
    category: 0,
  ),
  Weapon(
    id: 84,
    rarity: 4,
    imagePath: 'assets/images/weapons/catalysts/84.png',
    name: 'HakushinRing',
    gift: WeaponAscensionMaterials.branchesofaDistantSea,
    category: 4,
  ),
  Weapon(
    id: 85,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/85.png',
    name: 'Predator',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 3,
  ),
  Weapon(
    id: 86,
    rarity: 5,
    imagePath: 'assets/images/weapons/catalysts/86.png',
    name: 'EverlastingMoonglow',
    gift: WeaponAscensionMaterials.branchesofaDistantSea,
    category: 4,
  ),
  Weapon(
    id: 87,
    rarity: 5,
    imagePath: 'assets/images/weapons/bows/87.png',
    name: 'PolarStar',
    gift: WeaponAscensionMaterials.oniMasks,
    category: 3,
  ),
  Weapon(
    id: 88,
    rarity: 4,
    imagePath: 'assets/images/weapons/bows/88.png',
    name: 'Mouun\'s Moon',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 3,
  ),
  Weapon(
    id: 89,
    rarity: 4,
    imagePath: 'assets/images/weapons/polearms/89.png',
    name: 'Wavebreaker\'s Fin',
    gift: WeaponAscensionMaterials.oniMasks,
    category: 2,
  ),
  Weapon(
    id: 90,
    rarity: 4,
    imagePath: 'assets/images/weapons/swords/90.png',
    name: 'Cinnabar Spindle',
    gift: WeaponAscensionMaterials.decarabianTiles,
    category: 0,
  ),
  Weapon(
    id: 91,
    rarity: 5,
    imagePath: 'assets/images/weapons/claymores/91.png',
    name: 'Redhorn Stonethresher',
    gift: WeaponAscensionMaterials.narukamisMagatamas,
    category: 1,
  ),
  Weapon(
    id: 92,
    rarity: 5,
    imagePath: 'assets/images/weapons/polearms/92.png',
    name: 'Calamity Queller',
    gift: WeaponAscensionMaterials.elixirs,
    category: 2,
  ),
  Weapon(
      id: 93,
      rarity: 4,
      category: 4,
      imagePath: 'assets/images/weapons/catalysts/93.png',
      name: 'Oathsworn Eye',
      gift: WeaponAscensionMaterials.branchesofaDistantSea),
  Weapon(
      id: 94,
      rarity: 5,
      category: 4,
      imagePath: 'assets/images/weapons/catalysts/94.png',
      name: 'Kagura\'s Verity',
      gift: WeaponAscensionMaterials.oniMasks),
  Weapon(
      id: 95,
      rarity: 4,
      category: 1,
      imagePath: 'assets/images/weapons/claymores/95.png',
      name: 'Akuoumaru',
      gift: WeaponAscensionMaterials.branchesofaDistantSea),
  Weapon(
      id: 96,
      rarity: 4,
      category: 1,
      imagePath: 'assets/images/weapons/claymores/96.png',
      name: 'Luxurious Sea-Lord',
      gift: WeaponAscensionMaterials.aerosiderite),
  Weapon(
      id: 97,
      rarity: 5,
      category: 0,
      imagePath: 'assets/images/weapons/swords/97.png',
      name: 'Haran Geppaku Futsu',
      gift: WeaponAscensionMaterials.narukamisMagatamas),
  Weapon(
      id: 98,
      rarity: 5,
      category: 3,
      imagePath: 'assets/images/weapons/bows/98.png',
      name: 'Aqua Simulacra',
      gift: WeaponAscensionMaterials.guyunPillars),
  Weapon(
      id: 99,
      rarity: 4,
      category: 3,
      imagePath: 'assets/images/weapons/bows/99.png',
      name: 'Fading Twilight',
      gift: WeaponAscensionMaterials.aerosiderite),
];
