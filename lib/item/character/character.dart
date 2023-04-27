import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'character.freezed.dart';

// flutter pub run build_runner build
// flutter packages pub run build_runner build --delete-conflicting-outputs

@freezed
class Character with _$Character {
  const factory Character(
      {required int id,
      required int element,
      required String imagePath,
      required String name,
      required int gift}) = _Character;
  const Character._(); // メソッドやカスタムフィールドを追加したい場合追加

}
