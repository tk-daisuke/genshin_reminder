// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weapon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeaponTearOff {
  const _$WeaponTearOff();

  _Weapon call(
      {required int id,
      required int rarity,
      required int category,
      required String imagePath,
      required String name,
      required int gift}) {
    return _Weapon(
      id: id,
      rarity: rarity,
      category: category,
      imagePath: imagePath,
      name: name,
      gift: gift,
    );
  }
}

/// @nodoc
const $Weapon = _$WeaponTearOff();

/// @nodoc
mixin _$Weapon {
  int get id => throw _privateConstructorUsedError;
  int get rarity => throw _privateConstructorUsedError;
  int get category => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get gift => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeaponCopyWith<Weapon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeaponCopyWith<$Res> {
  factory $WeaponCopyWith(Weapon value, $Res Function(Weapon) then) =
      _$WeaponCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int rarity,
      int category,
      String imagePath,
      String name,
      int gift});
}

/// @nodoc
class _$WeaponCopyWithImpl<$Res> implements $WeaponCopyWith<$Res> {
  _$WeaponCopyWithImpl(this._value, this._then);

  final Weapon _value;
  // ignore: unused_field
  final $Res Function(Weapon) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? rarity = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? name = freezed,
    Object? gift = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gift: gift == freezed
          ? _value.gift
          : gift // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$WeaponCopyWith<$Res> implements $WeaponCopyWith<$Res> {
  factory _$WeaponCopyWith(_Weapon value, $Res Function(_Weapon) then) =
      __$WeaponCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int rarity,
      int category,
      String imagePath,
      String name,
      int gift});
}

/// @nodoc
class __$WeaponCopyWithImpl<$Res> extends _$WeaponCopyWithImpl<$Res>
    implements _$WeaponCopyWith<$Res> {
  __$WeaponCopyWithImpl(_Weapon _value, $Res Function(_Weapon) _then)
      : super(_value, (v) => _then(v as _Weapon));

  @override
  _Weapon get _value => super._value as _Weapon;

  @override
  $Res call({
    Object? id = freezed,
    Object? rarity = freezed,
    Object? category = freezed,
    Object? imagePath = freezed,
    Object? name = freezed,
    Object? gift = freezed,
  }) {
    return _then(_Weapon(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as int,
      imagePath: imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gift: gift == freezed
          ? _value.gift
          : gift // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Weapon extends _Weapon with DiagnosticableTreeMixin {
  const _$_Weapon(
      {required this.id,
      required this.rarity,
      required this.category,
      required this.imagePath,
      required this.name,
      required this.gift})
      : super._();

  @override
  final int id;
  @override
  final int rarity;
  @override
  final int category;
  @override
  final String imagePath;
  @override
  final String name;
  @override
  final int gift;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Weapon(id: $id, rarity: $rarity, category: $category, imagePath: $imagePath, name: $name, gift: $gift)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Weapon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('rarity', rarity))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('gift', gift));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Weapon &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.rarity, rarity) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.imagePath, imagePath) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.gift, gift));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(rarity),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(imagePath),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(gift));

  @JsonKey(ignore: true)
  @override
  _$WeaponCopyWith<_Weapon> get copyWith =>
      __$WeaponCopyWithImpl<_Weapon>(this, _$identity);
}

abstract class _Weapon extends Weapon {
  const factory _Weapon(
      {required int id,
      required int rarity,
      required int category,
      required String imagePath,
      required String name,
      required int gift}) = _$_Weapon;
  const _Weapon._() : super._();

  @override
  int get id;
  @override
  int get rarity;
  @override
  int get category;
  @override
  String get imagePath;
  @override
  String get name;
  @override
  int get gift;
  @override
  @JsonKey(ignore: true)
  _$WeaponCopyWith<_Weapon> get copyWith => throw _privateConstructorUsedError;
}
