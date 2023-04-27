import 'package:genshin_reminder/item/weapon/weapon_types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final weaponFilterProvider = StateProvider<int>((ref) => 0);
final weaponSelectProvider = StateProvider<int>((ref) => 6);

class WeaponModel {
  void selectFilter(int index, StateController<int> selectWeaponType,
      StateController<int> filter) {
    if (index == 0) {
      selectWeaponType.state = 6;
      filter.state = index;
    } else if (index == 1) {
      selectWeaponType.state = WeaponCategory.sword;
      filter.state = index;
    } else if (index == 2) {
      selectWeaponType.state = WeaponCategory.claymore;
      filter.state = index;
    } else if (index == 3) {
      selectWeaponType.state = WeaponCategory.polearms;
      filter.state = index;
    } else if (index == 4) {
      selectWeaponType.state = WeaponCategory.catalysts;
      filter.state = index;
    } else if (index == 5) {
      selectWeaponType.state = WeaponCategory.bows;
      filter.state = index;
    }
  }
}
