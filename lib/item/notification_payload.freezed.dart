// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return _NotificationPayload.fromJson(json);
}

/// @nodoc
class _$NotificationPayloadTearOff {
  const _$NotificationPayloadTearOff();

  _NotificationPayload call(
      {required LevelUpMaterial levelUpMaterial,
      required UserSettings userSettings,
      required int noticeID,
      required int weekID,
      required bool loopFlag,
      required String location,
      required String timezone,
      required bool summerTime}) {
    return _NotificationPayload(
      levelUpMaterial: levelUpMaterial,
      userSettings: userSettings,
      noticeID: noticeID,
      weekID: weekID,
      loopFlag: loopFlag,
      location: location,
      timezone: timezone,
      summerTime: summerTime,
    );
  }

  NotificationPayload fromJson(Map<String, Object?> json) {
    return NotificationPayload.fromJson(json);
  }
}

/// @nodoc
const $NotificationPayload = _$NotificationPayloadTearOff();

/// @nodoc
mixin _$NotificationPayload {
  LevelUpMaterial get levelUpMaterial => throw _privateConstructorUsedError;
  UserSettings get userSettings => throw _privateConstructorUsedError;
  int get noticeID => throw _privateConstructorUsedError;
  int get weekID => throw _privateConstructorUsedError;
  bool get loopFlag => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  bool get summerTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPayloadCopyWith<NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPayloadCopyWith<$Res> {
  factory $NotificationPayloadCopyWith(
          NotificationPayload value, $Res Function(NotificationPayload) then) =
      _$NotificationPayloadCopyWithImpl<$Res>;
  $Res call(
      {LevelUpMaterial levelUpMaterial,
      UserSettings userSettings,
      int noticeID,
      int weekID,
      bool loopFlag,
      String location,
      String timezone,
      bool summerTime});

  $LevelUpMaterialCopyWith<$Res> get levelUpMaterial;
  $UserSettingsCopyWith<$Res> get userSettings;
}

/// @nodoc
class _$NotificationPayloadCopyWithImpl<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  _$NotificationPayloadCopyWithImpl(this._value, this._then);

  final NotificationPayload _value;
  // ignore: unused_field
  final $Res Function(NotificationPayload) _then;

  @override
  $Res call({
    Object? levelUpMaterial = freezed,
    Object? userSettings = freezed,
    Object? noticeID = freezed,
    Object? weekID = freezed,
    Object? loopFlag = freezed,
    Object? location = freezed,
    Object? timezone = freezed,
    Object? summerTime = freezed,
  }) {
    return _then(_value.copyWith(
      levelUpMaterial: levelUpMaterial == freezed
          ? _value.levelUpMaterial
          : levelUpMaterial // ignore: cast_nullable_to_non_nullable
              as LevelUpMaterial,
      userSettings: userSettings == freezed
          ? _value.userSettings
          : userSettings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      noticeID: noticeID == freezed
          ? _value.noticeID
          : noticeID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      summerTime: summerTime == freezed
          ? _value.summerTime
          : summerTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $LevelUpMaterialCopyWith<$Res> get levelUpMaterial {
    return $LevelUpMaterialCopyWith<$Res>(_value.levelUpMaterial, (value) {
      return _then(_value.copyWith(levelUpMaterial: value));
    });
  }

  @override
  $UserSettingsCopyWith<$Res> get userSettings {
    return $UserSettingsCopyWith<$Res>(_value.userSettings, (value) {
      return _then(_value.copyWith(userSettings: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationPayloadCopyWith<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  factory _$NotificationPayloadCopyWith(_NotificationPayload value,
          $Res Function(_NotificationPayload) then) =
      __$NotificationPayloadCopyWithImpl<$Res>;
  @override
  $Res call(
      {LevelUpMaterial levelUpMaterial,
      UserSettings userSettings,
      int noticeID,
      int weekID,
      bool loopFlag,
      String location,
      String timezone,
      bool summerTime});

  @override
  $LevelUpMaterialCopyWith<$Res> get levelUpMaterial;
  @override
  $UserSettingsCopyWith<$Res> get userSettings;
}

/// @nodoc
class __$NotificationPayloadCopyWithImpl<$Res>
    extends _$NotificationPayloadCopyWithImpl<$Res>
    implements _$NotificationPayloadCopyWith<$Res> {
  __$NotificationPayloadCopyWithImpl(
      _NotificationPayload _value, $Res Function(_NotificationPayload) _then)
      : super(_value, (v) => _then(v as _NotificationPayload));

  @override
  _NotificationPayload get _value => super._value as _NotificationPayload;

  @override
  $Res call({
    Object? levelUpMaterial = freezed,
    Object? userSettings = freezed,
    Object? noticeID = freezed,
    Object? weekID = freezed,
    Object? loopFlag = freezed,
    Object? location = freezed,
    Object? timezone = freezed,
    Object? summerTime = freezed,
  }) {
    return _then(_NotificationPayload(
      levelUpMaterial: levelUpMaterial == freezed
          ? _value.levelUpMaterial
          : levelUpMaterial // ignore: cast_nullable_to_non_nullable
              as LevelUpMaterial,
      userSettings: userSettings == freezed
          ? _value.userSettings
          : userSettings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      noticeID: noticeID == freezed
          ? _value.noticeID
          : noticeID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      timezone: timezone == freezed
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      summerTime: summerTime == freezed
          ? _value.summerTime
          : summerTime // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPayload extends _NotificationPayload
    with DiagnosticableTreeMixin {
  const _$_NotificationPayload(
      {required this.levelUpMaterial,
      required this.userSettings,
      required this.noticeID,
      required this.weekID,
      required this.loopFlag,
      required this.location,
      required this.timezone,
      required this.summerTime})
      : super._();

  factory _$_NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPayloadFromJson(json);

  @override
  final LevelUpMaterial levelUpMaterial;
  @override
  final UserSettings userSettings;
  @override
  final int noticeID;
  @override
  final int weekID;
  @override
  final bool loopFlag;
  @override
  final String location;
  @override
  final String timezone;
  @override
  final bool summerTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationPayload(levelUpMaterial: $levelUpMaterial, userSettings: $userSettings, noticeID: $noticeID, weekID: $weekID, loopFlag: $loopFlag, location: $location, timezone: $timezone, summerTime: $summerTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationPayload'))
      ..add(DiagnosticsProperty('levelUpMaterial', levelUpMaterial))
      ..add(DiagnosticsProperty('userSettings', userSettings))
      ..add(DiagnosticsProperty('noticeID', noticeID))
      ..add(DiagnosticsProperty('weekID', weekID))
      ..add(DiagnosticsProperty('loopFlag', loopFlag))
      ..add(DiagnosticsProperty('location', location))
      ..add(DiagnosticsProperty('timezone', timezone))
      ..add(DiagnosticsProperty('summerTime', summerTime));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPayload &&
            const DeepCollectionEquality()
                .equals(other.levelUpMaterial, levelUpMaterial) &&
            const DeepCollectionEquality()
                .equals(other.userSettings, userSettings) &&
            const DeepCollectionEquality().equals(other.noticeID, noticeID) &&
            const DeepCollectionEquality().equals(other.weekID, weekID) &&
            const DeepCollectionEquality().equals(other.loopFlag, loopFlag) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.timezone, timezone) &&
            const DeepCollectionEquality()
                .equals(other.summerTime, summerTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(levelUpMaterial),
      const DeepCollectionEquality().hash(userSettings),
      const DeepCollectionEquality().hash(noticeID),
      const DeepCollectionEquality().hash(weekID),
      const DeepCollectionEquality().hash(loopFlag),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(timezone),
      const DeepCollectionEquality().hash(summerTime));

  @JsonKey(ignore: true)
  @override
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      __$NotificationPayloadCopyWithImpl<_NotificationPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPayloadToJson(this);
  }
}

abstract class _NotificationPayload extends NotificationPayload {
  const factory _NotificationPayload(
      {required LevelUpMaterial levelUpMaterial,
      required UserSettings userSettings,
      required int noticeID,
      required int weekID,
      required bool loopFlag,
      required String location,
      required String timezone,
      required bool summerTime}) = _$_NotificationPayload;
  const _NotificationPayload._() : super._();

  factory _NotificationPayload.fromJson(Map<String, dynamic> json) =
      _$_NotificationPayload.fromJson;

  @override
  LevelUpMaterial get levelUpMaterial;
  @override
  UserSettings get userSettings;
  @override
  int get noticeID;
  @override
  int get weekID;
  @override
  bool get loopFlag;
  @override
  String get location;
  @override
  String get timezone;
  @override
  bool get summerTime;
  @override
  @JsonKey(ignore: true)
  _$NotificationPayloadCopyWith<_NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
