import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/lvup_material_name.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';

class LevelUpMaterialList {
  List<LevelUpMaterial> talentLevelUpMaterials = const [
    // mond
    LevelUpMaterial(
      id: TalentMaterials.freedom,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 111,
      week1NotificationOnceID: 112,
      week2NotificationLoopID: 113,
      week2NotificationOnceID: 114,
      worldID: WorldID.mondstadt,
      domainID: DomainID.forsakenRift,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.resistance,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 121,
      week1NotificationOnceID: 122,
      week2NotificationLoopID: 123,
      week2NotificationOnceID: 124,
      worldID: WorldID.mondstadt,
      domainID: DomainID.forsakenRift,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.ballad,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 131,
      week1NotificationOnceID: 132,
      week2NotificationLoopID: 133,
      week2NotificationOnceID: 134,
      worldID: WorldID.mondstadt,
      domainID: DomainID.forsakenRift,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.forsakenRift,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 101,
      week1NotificationOnceID: 102,
      week2NotificationLoopID: 101,
      week2NotificationOnceID: 102,
      worldID: WorldID.mondstadt,
      domainID: DomainID.forsakenRift,
      materialTypeID: LevelUpMaterialType.character,
    ),
    // liyue
    LevelUpMaterial(
      id: TalentMaterials.prosperity,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 211,
      week1NotificationOnceID: 212,
      week2NotificationLoopID: 213,
      week2NotificationOnceID: 214,
      worldID: WorldID.liyue,
      domainID: DomainID.taishanMansion,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.diligence,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 221,
      week1NotificationOnceID: 222,
      week2NotificationLoopID: 223,
      week2NotificationOnceID: 224,
      worldID: WorldID.liyue,
      domainID: DomainID.taishanMansion,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.gold,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 231,
      week1NotificationOnceID: 232,
      week2NotificationLoopID: 233,
      week2NotificationOnceID: 234,
      worldID: WorldID.liyue,
      domainID: DomainID.taishanMansion,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.taishanMansion,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 201,
      week1NotificationOnceID: 202,
      week2NotificationLoopID: 201,
      week2NotificationOnceID: 202,
      worldID: WorldID.liyue,
      domainID: DomainID.taishanMansion,
      materialTypeID: LevelUpMaterialType.character,
    ),
    // inazuma
    LevelUpMaterial(
      id: TalentMaterials.transience,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 311,
      week1NotificationOnceID: 312,
      week2NotificationLoopID: 313,
      week2NotificationOnceID: 314,
      worldID: WorldID.inazuma,
      domainID: DomainID.violetCourt,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.elegance,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 321,
      week1NotificationOnceID: 322,
      week2NotificationLoopID: 323,
      week2NotificationOnceID: 324,
      worldID: WorldID.inazuma,
      domainID: DomainID.violetCourt,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.light,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 331,
      week1NotificationOnceID: 332,
      week2NotificationLoopID: 333,
      week2NotificationOnceID: 334,
      worldID: WorldID.inazuma,
      domainID: DomainID.violetCourt,
      materialTypeID: LevelUpMaterialType.character,
    ),
    LevelUpMaterial(
      id: TalentMaterials.violetCourt,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 301,
      week1NotificationOnceID: 302,
      week2NotificationLoopID: 301,
      week2NotificationOnceID: 302,
      worldID: WorldID.inazuma,
      domainID: DomainID.violetCourt,
      materialTypeID: LevelUpMaterialType.character,
    ),
  ];

  List<LevelUpMaterial> weaponMaterials = const [
    LevelUpMaterial(
      id: WeaponAscensionMaterials.ciliaGarden,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 20101,
      week1NotificationOnceID: 20102,
      week2NotificationLoopID: 20101,
      week2NotificationOnceID: 20102,
      worldID: WorldID.mondstadt,
      domainID: DomainID.ceciliaGarden,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.decarabianTiles,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 20111,
      week1NotificationOnceID: 20112,
      week2NotificationLoopID: 20113,
      week2NotificationOnceID: 20114,
      worldID: WorldID.mondstadt,
      domainID: DomainID.ceciliaGarden,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.borealWolfTeeth,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 20121,
      week1NotificationOnceID: 20122,
      week2NotificationLoopID: 20123,
      week2NotificationOnceID: 20124,
      worldID: WorldID.mondstadt,
      domainID: DomainID.ceciliaGarden,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.gladiatorShackle,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 20131,
      week1NotificationOnceID: 20132,
      week2NotificationLoopID: 20133,
      week2NotificationOnceID: 20134,
      worldID: WorldID.mondstadt,
      domainID: DomainID.ceciliaGarden,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.hiddenPalaceofLianshanFormula,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 20201,
      week1NotificationOnceID: 20202,
      week2NotificationLoopID: 20201,
      week2NotificationOnceID: 20202,
      worldID: WorldID.liyue,
      domainID: DomainID.hiddenPalaceofLianshanFormula,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.guyunPillars,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 20211,
      week1NotificationOnceID: 20212,
      week2NotificationLoopID: 20213,
      week2NotificationOnceID: 20214,
      worldID: WorldID.liyue,
      domainID: DomainID.hiddenPalaceofLianshanFormula,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.elixirs,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 20221,
      week1NotificationOnceID: 20222,
      week2NotificationLoopID: 20223,
      week2NotificationOnceID: 20224,
      worldID: WorldID.liyue,
      domainID: DomainID.hiddenPalaceofLianshanFormula,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.aerosiderite,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 20231,
      week1NotificationOnceID: 20232,
      week2NotificationLoopID: 20233,
      week2NotificationOnceID: 20234,
      worldID: WorldID.liyue,
      domainID: DomainID.hiddenPalaceofLianshanFormula,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.courtofFlowingSand,
      week1: DateTime.sunday,
      week2: DateTime.sunday,
      week1NotificationLoopID: 20301,
      week1NotificationOnceID: 20302,
      week2NotificationLoopID: 20301,
      week2NotificationOnceID: 20302,
      worldID: WorldID.inazuma,
      domainID: DomainID.courtofFlowingSand,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.branchesofaDistantSea,
      week1: DateTime.monday,
      week2: DateTime.thursday,
      week1NotificationLoopID: 20311,
      week1NotificationOnceID: 20312,
      week2NotificationLoopID: 20313,
      week2NotificationOnceID: 20314,
      worldID: WorldID.inazuma,
      domainID: DomainID.courtofFlowingSand,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.narukamisMagatamas,
      week1: DateTime.tuesday,
      week2: DateTime.friday,
      week1NotificationLoopID: 20321,
      week1NotificationOnceID: 20322,
      week2NotificationLoopID: 20323,
      week2NotificationOnceID: 20324,
      worldID: WorldID.inazuma,
      domainID: DomainID.courtofFlowingSand,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
    LevelUpMaterial(
      id: WeaponAscensionMaterials.oniMasks,
      week1: DateTime.wednesday,
      week2: DateTime.saturday,
      week1NotificationLoopID: 20331,
      week1NotificationOnceID: 20332,
      week2NotificationLoopID: 20333,
      week2NotificationOnceID: 20334,
      worldID: WorldID.inazuma,
      domainID: DomainID.courtofFlowingSand,
      materialTypeID: LevelUpMaterialType.weapon,
    ),
  ];
  // LevelUpMaterial payloadToMaterialData(
  //     BuildContext context, int levelUpMaterialID) {
  //   final list = LevelUpMaterialList();
  //   switch (levelUpMaterialID) {
  //     case TalentMaterials.freedom:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.freedom];
  //     case TalentMaterials.resistance:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.resistance];
  //     case TalentMaterials.ballad:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.ballad];
  //     case TalentMaterials.forsakenRift:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.forsakenRift]
  // ;
  //     case TalentMaterials.prosperity:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.prosperity];
  //     case TalentMaterials.diligence:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.diligence];
  //     case TalentMaterials.gold:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.gold];
  //     case TalentMaterials.taishanMansion:
  //       return list
  //           .talentLevelUpMaterials[TalentMaterialIndexs.taishanMansion];
  //     case TalentMaterials.transience:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.transience];
  //     case TalentMaterials.elegance:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.elegance];
  //     case TalentMaterials.light:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.light];
  //     case TalentMaterials.violetCourt:
  //       return list.talentLevelUpMaterials[TalentMaterialIndexs.violetCourt];
  //     default:
  //       return const LevelUpMaterial(
  //         id: TalentMaterials.violetCourt,
  //         week1: DateTime.sunday,
  //         week2: DateTime.sunday,
  //         week1NotificationLoopID: 301,
  //         week1NotificationOnceID: 302,
  //         week2NotificationLoopID: 301,
  //         week2NotificationOnceID: 302,
  //         worldID: WorldID.inazuma,
  //         domainID: DomainID.violetCourt,
  //         materialTypeID: LevelUpMaterialType.character,
  //       );
  //   }
  // }

  String getWeekName(BuildContext context, int id) {
    final _l10n = AppLocalizations.of(context);
    final String week;
    if (id == DateTime.monday) {
      week = _l10n?.monday ?? '';
    } else if (id == DateTime.tuesday) {
      week = _l10n?.tuesday ?? '';
    } else if (id == DateTime.wednesday) {
      week = _l10n?.wednesday ?? '';
    } else if (id == DateTime.thursday) {
      week = _l10n?.thursday ?? '';
    } else if (id == DateTime.friday) {
      week = _l10n?.friday ?? '';
    } else if (id == DateTime.saturday) {
      week = _l10n?.saturday ?? '';
    } else if (id == DateTime.sunday) {
      week = _l10n?.sunday ?? '';
    } else {
      week = '';
    }
    return week;
  }

  // String getWeek2Name(
  //     BuildContext context, LevelUpMaterial talentMaterialData) {
  //   final _l10n = AppLocalizations.of(context);
  //   final String week2;

  //   if (talentMaterialData.week2 == 1) {
  //     week2 = _l10n?.monday;
  //   } else if (talentMaterialData.week2 == 2) {
  //     week2 = _l10n?.tuesday;
  //   } else if (talentMaterialData.week2 == 3) {
  //     week2 = _l10n?.wednesday;
  //   } else if (talentMaterialData.week2 == 4) {
  //     week2 = _l10n?.thursday;
  //   } else if (talentMaterialData.week2 == 5) {
  //     week2 = _l10n?.friday;
  //   } else if (talentMaterialData.week2 == 6) {
  //     week2 = _l10n?.saturday;
  //   } else if (talentMaterialData.week2 == 7) {
  //     week2 = _l10n?.sunday;
  //   } else {
  //     week2 = '';
  //   }

  //   return week2;
  // }
  // bool lvupMaterialIsSunday(int id) {
  //   final isSunday = id == TalentMaterials.forsakenRift ||
  //       id == TalentMaterials.taishanMansion ||
  //       id == TalentMaterials.violetCourt ||
  //       id == WeaponAscensionMaterials.ciliaGarden ||
  //       id == WeaponAscensionMaterials.hiddenPalaceofLianshanFormula ||
  //       id == WeaponAscensionMaterials.courtofFlowingSand;
  //   return isSunday;
  // }
  String getMaterialWeek(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    final _l10n = AppLocalizations.of(context);
    final String week;

    if (talentMaterialData.week1 == DateTime.monday) {
      week = _l10n?.mon_thu ?? '';
    } else if (talentMaterialData.week1 == DateTime.tuesday) {
      week = _l10n?.tue_fri ?? '';
    } else if (talentMaterialData.week1 == DateTime.wednesday) {
      week = _l10n?.wed_sat ?? '';
    } else if (talentMaterialData.week1 == DateTime.sunday) {
      week = _l10n?.sunday_all ?? '';
    } else {
      week = '';
    }
    return week;
  }

  String getWorldName(
      BuildContext context, LevelUpMaterial talentMaterialData) {
    final _l10n = AppLocalizations.of(context);

    final String worldName;
    if (talentMaterialData.worldID == WorldID.mondstadt) {
      worldName = _l10n?.mondstadt ?? '';
    } else if (talentMaterialData.worldID == WorldID.liyue) {
      worldName = _l10n?.liyue ?? '';
    } else if (talentMaterialData.worldID == WorldID.inazuma) {
      worldName = _l10n?.inazuma ?? '';
    } else {
      worldName = '';
    }
    return worldName;
  }

  String getNotificationTitle(BuildContext context,
      LevelUpMaterial talentMaterialData, String materialName) {
    final _l10n = AppLocalizations.of(context);
    final String title;
    if (talentMaterialData.materialTypeID == LevelUpMaterialType.character) {
      title = '${_l10n?.talent_level_up_material}'
          ' $materialName';
    } else if (talentMaterialData.materialTypeID ==
        LevelUpMaterialType.weapon) {
      title = '${_l10n?.weapon_materials}'
          ' $materialName';
    } else {
      title = '';
    }
    return title;
  }

  String getDomainName(
    BuildContext context,
    LevelUpMaterial talentMaterialData,
  ) {
    final String domainName;
    final _l10n = AppLocalizations.of(context);
    final domain = talentMaterialData.domainID;
    if (domain == DomainID.forsakenRift) {
      domainName = _l10n?.forsaken_rift ?? '';
    } else if (domain == DomainID.taishanMansion) {
      domainName = _l10n?.taishan_mansion ?? '';
    } else if (domain == DomainID.violetCourt) {
      domainName = _l10n?.violet_court ?? '';
    } else if (domain == DomainID.ceciliaGarden) {
      domainName = _l10n?.cecilia_garden ?? '';
    } else if (domain == DomainID.hiddenPalaceofLianshanFormula) {
      domainName = _l10n?.hiddenPalaceofLianshanFormula ?? '';
    } else if (domain == DomainID.courtofFlowingSand) {
      domainName = _l10n?.courtofFlowingSand ?? '';
    } else {
      domainName = '';
    }
    return domainName;
  }

  String getLvUpMaterialName(
    BuildContext context,
    int id,
  ) {
    final _l10n = AppLocalizations.of(context);
    final lvUpMaterialID = id;
    switch (lvUpMaterialID) {
      case TalentMaterials.freedom:
        return _l10n?.freedom_110 ?? '';
      case TalentMaterials.resistance:
        return _l10n?.resistance_120 ?? '';
      case TalentMaterials.ballad:
        return _l10n?.ballad_130 ?? '';
      case TalentMaterials.prosperity:
        return _l10n?.prosperity_210 ?? '';
      case TalentMaterials.diligence:
        return _l10n?.diligence_220 ?? '';
      case TalentMaterials.gold:
        return _l10n?.gold_230 ?? '';
      case TalentMaterials.transience:
        return _l10n?.transience_310 ?? '';
      case TalentMaterials.elegance:
        return _l10n?.elegance_320 ?? '';
      case TalentMaterials.light:
        return _l10n?.light_330 ?? '';
      case WeaponAscensionMaterials.aerosiderite:
        return _l10n?.aerosiderite ?? '';
      case WeaponAscensionMaterials.borealWolfTeeth:
        return _l10n?.borealWolfTeeth ?? '';
      case WeaponAscensionMaterials.branchesofaDistantSea:
        return _l10n?.branchesofaDistantSea ?? '';
      case WeaponAscensionMaterials.ciliaGarden:
        return _l10n?.cecilia_garden ?? '';
      case WeaponAscensionMaterials.courtofFlowingSand:
        return _l10n?.court_of_flowing_sand ?? '';
      case WeaponAscensionMaterials.decarabianTiles:
        return _l10n?.decarabianTiles ?? '';
      case WeaponAscensionMaterials.elixirs:
        return _l10n?.elixirs ?? '';
      case WeaponAscensionMaterials.gladiatorShackle:
        return _l10n?.gladiatorShackle ?? '';
      case WeaponAscensionMaterials.guyunPillars:
        return _l10n?.guyunPillars ?? '';
      case WeaponAscensionMaterials.hiddenPalaceofLianshanFormula:
        return _l10n?.hiddenPalaceofLianshanFormula ?? '';
      case WeaponAscensionMaterials.narukamisMagatamas:
        return _l10n?.narukamisMagatamas ?? '';
      case WeaponAscensionMaterials.oniMasks:
        return _l10n?.oniMasks ?? '';
      default:
        return '';
    }
  }

  LvUpMaterialName materialNames(
    BuildContext context,
    LevelUpMaterial doc,
  ) {
    final String materialName1;
    final String materialName2;
    final String materialName3;
    final isSunday = doc.week1 == DateTime.sunday;

    if (isSunday) {
      materialName1 = getLvUpMaterialName(context, doc.id + 10);
      materialName2 = getLvUpMaterialName(context, doc.id + 20);
      materialName3 = getLvUpMaterialName(context, doc.id + 30);
      return LvUpMaterialName(
          materialName1: materialName1,
          materialName2: materialName2,
          materialName3: materialName3);
    } else {
      materialName1 = getLvUpMaterialName(context, doc.id);
      materialName2 = '';
      materialName3 = '';
      return LvUpMaterialName(
          materialName1: materialName1,
          materialName2: materialName2,
          materialName3: materialName3);
    }
  }
}
