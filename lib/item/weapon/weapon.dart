import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'weapon.freezed.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class Weapon with _$Weapon {
  const factory Weapon(
      {required int id,
      required int rarity,
      required int category,
      required String imagePath,
      required String name,
      required int gift}) = _Weapon;
  // ignore: unused_element
  const Weapon._(); // メソッドやカスタムフィールドを追加したい場合追加

}
