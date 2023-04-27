import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// `{ファイル名}.freezed.dart` と書きます。
part 'lvup_material_name.freezed.dart';

// flutter pub run build_runner build
// flutter pub run build_runner build    --delete-conflicting-outputs

@freezed
class LvUpMaterialName with _$LvUpMaterialName {
  const factory LvUpMaterialName(
      {required String materialName1,
      required String materialName2,
      required String materialName3}) = _LvUpMaterialName;
  const LvUpMaterialName._(); // メソッドやカスタムフィールドを追加したい場合追加

}
