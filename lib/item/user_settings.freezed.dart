// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
class _$UserSettingsTearOff {
  const _$UserSettingsTearOff();

  _UserSettings call(
      {required int hour,
      required int minute,
      double imagesSize = 45.11,
      bool sundayActive = true,
      bool travellerSora = false,
      required String timezone}) {
    return _UserSettings(
      hour: hour,
      minute: minute,
      imagesSize: imagesSize,
      sundayActive: sundayActive,
      travellerSora: travellerSora,
      timezone: timezone,
    );
  }

  UserSettings fromJson(Map<String, Object?> json) {
    return UserSettings.fromJson(json);
  }
}

/// @nodoc
const $UserSettings = _$UserSettingsTearOff();

/// @nodoc
mixin _$UserSettings {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;
  double get imagesSize => throw _privateConstructorUsedError;
  bool get sundayActive => throw _privateConstructorUsedError;
  bool get travellerSora => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res>;
  $Res call(
      {int hour,
      int minute,
      double imagesSize,
      bool sundayActive,
      bool travellerSora,
      String timezone});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res> implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  final UserSettings _value;
  // ignore: unused_field
  final $Res Function(UserSettings) _then;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
    Object? imagesSize = freezed,
    Object? sundayActive = freezed,
    Object? travellerSora = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_value.copyWith(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      imagesSize: imagesSize == freezed
          ? _value.imagesSize
          : imagesSize // ignore: cast_nullable_to_non_nullable
              as double,
      sundayActive: sundayActive == freezed
          ? _value.sundayActive
          : sundayActive // ignore: cast_nullable_to_non_nullable
              as bool,
      travellerSora: travellerSora == freezed
          ? _value.travellerSora
          : travellerSora // ignore: cast_nullable_to_non_nullable
              as bool,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserSettingsCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$UserSettingsCopyWith(
          _UserSettings value, $Res Function(_UserSettings) then) =
      __$UserSettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int hour,
      int minute,
      double imagesSize,
      bool sundayActive,
      bool travellerSora,
      String timezone});
}

/// @nodoc
class __$UserSettingsCopyWithImpl<$Res> extends _$UserSettingsCopyWithImpl<$Res>
    implements _$UserSettingsCopyWith<$Res> {
  __$UserSettingsCopyWithImpl(
      _UserSettings _value, $Res Function(_UserSettings) _then)
      : super(_value, (v) => _then(v as _UserSettings));

  @override
  _UserSettings get _value => super._value as _UserSettings;

  @override
  $Res call({
    Object? hour = freezed,
    Object? minute = freezed,
    Object? imagesSize = freezed,
    Object? sundayActive = freezed,
    Object? travellerSora = freezed,
    Object? timezone = freezed,
  }) {
    return _then(_UserSettings(
      hour: hour == freezed
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: minute == freezed
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
      imagesSize: imagesSize == freezed
          ? _value.imagesSize
          : imagesSize // ignore: cast_nullable_to_non_nullable
              as double,
      sundayActive: sundayActive == freezed
          ? _value.sundayActive
          : sundayActive // ignore: cast_nullable_to_non_nullable
              as bool,
      travellerSora: travellerSora == freezed
          ? _value.travellerSora
          : travellerSora // ignore: cast_nullable_to_non_nullable
              as bool,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSettings extends _UserSettings with DiagnosticableTreeMixin {
  const _$_UserSettings(
      {required this.hour,
      required this.minute,
      this.imagesSize = 45.11,
      this.sundayActive = true,
      this.travellerSora = false,
      required this.timezone})
      : super._();

  factory _$_UserSettings.fromJson(Map<String, dynamic> json) =>
      _$$_UserSettingsFromJson(json);

  @override
  final int hour;
  @override
  final int minute;
  @JsonKey()
  @override
  final double imagesSize;
  @JsonKey()
  @override
  final bool sundayActive;
  @JsonKey()
  @override
  final bool travellerSora;
  @override
  final String timezone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserSettings(hour: $hour, minute: $minute, imagesSize: $imagesSize, sundayActive: $sundayActive, travellerSora: $travellerSora, timezone: $timezone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserSettings'))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('minute', minute))
      ..add(DiagnosticsProperty('imagesSize', imagesSize))
      ..add(DiagnosticsProperty('sundayActive', sundayActive))
      ..add(DiagnosticsProperty('travellerSora', travellerSora))
      ..add(DiagnosticsProperty('timezone', timezone));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserSettings &&
            const DeepCollectionEquality().equals(other.hour, hour) &&
            const DeepCollectionEquality().equals(other.minute, minute) &&
            const DeepCollectionEquality()
                .equals(other.imagesSize, imagesSize) &&
            const DeepCollectionEquality()
                .equals(other.sundayActive, sundayActive) &&
            const DeepCollectionEquality()
                .equals(other.travellerSora, travellerSora) &&
            const DeepCollectionEquality().equals(other.timezone, timezone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(hour),
      const DeepCollectionEquality().hash(minute),
      const DeepCollectionEquality().hash(imagesSize),
      const DeepCollectionEquality().hash(sundayActive),
      const DeepCollectionEquality().hash(travellerSora),
      const DeepCollectionEquality().hash(timezone));

  @JsonKey(ignore: true)
  @override
  _$UserSettingsCopyWith<_UserSettings> get copyWith =>
      __$UserSettingsCopyWithImpl<_UserSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSettingsToJson(this);
  }
}

abstract class _UserSettings extends UserSettings {
  const factory _UserSettings(
      {required int hour,
      required int minute,
      double imagesSize,
      bool sundayActive,
      bool travellerSora,
      required String timezone}) = _$_UserSettings;
  const _UserSettings._() : super._();

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$_UserSettings.fromJson;

  @override
  int get hour;
  @override
  int get minute;
  @override
  double get imagesSize;
  @override
  bool get sundayActive;
  @override
  bool get travellerSora;
  @override
  String get timezone;
  @override
  @JsonKey(ignore: true)
  _$UserSettingsCopyWith<_UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
