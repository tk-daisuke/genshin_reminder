// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationValueTearOff {
  const _$NotificationValueTearOff();

  _NotificationValue call(
      {required int notificationID,
      required int weekID,
      required UserSettings setting,
      required String title,
      required String comment,
      required String payload,
      required bool loopFlag}) {
    return _NotificationValue(
      notificationID: notificationID,
      weekID: weekID,
      setting: setting,
      title: title,
      comment: comment,
      payload: payload,
      loopFlag: loopFlag,
    );
  }
}

/// @nodoc
const $NotificationValue = _$NotificationValueTearOff();

/// @nodoc
mixin _$NotificationValue {
  int get notificationID => throw _privateConstructorUsedError;
  int get weekID => throw _privateConstructorUsedError;
  UserSettings get setting => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  bool get loopFlag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationValueCopyWith<NotificationValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationValueCopyWith<$Res> {
  factory $NotificationValueCopyWith(
          NotificationValue value, $Res Function(NotificationValue) then) =
      _$NotificationValueCopyWithImpl<$Res>;
  $Res call(
      {int notificationID,
      int weekID,
      UserSettings setting,
      String title,
      String comment,
      String payload,
      bool loopFlag});

  $UserSettingsCopyWith<$Res> get setting;
}

/// @nodoc
class _$NotificationValueCopyWithImpl<$Res>
    implements $NotificationValueCopyWith<$Res> {
  _$NotificationValueCopyWithImpl(this._value, this._then);

  final NotificationValue _value;
  // ignore: unused_field
  final $Res Function(NotificationValue) _then;

  @override
  $Res call({
    Object? notificationID = freezed,
    Object? weekID = freezed,
    Object? setting = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? payload = freezed,
    Object? loopFlag = freezed,
  }) {
    return _then(_value.copyWith(
      notificationID: notificationID == freezed
          ? _value.notificationID
          : notificationID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserSettingsCopyWith<$Res> get setting {
    return $UserSettingsCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value));
    });
  }
}

/// @nodoc
abstract class _$NotificationValueCopyWith<$Res>
    implements $NotificationValueCopyWith<$Res> {
  factory _$NotificationValueCopyWith(
          _NotificationValue value, $Res Function(_NotificationValue) then) =
      __$NotificationValueCopyWithImpl<$Res>;
  @override
  $Res call(
      {int notificationID,
      int weekID,
      UserSettings setting,
      String title,
      String comment,
      String payload,
      bool loopFlag});

  @override
  $UserSettingsCopyWith<$Res> get setting;
}

/// @nodoc
class __$NotificationValueCopyWithImpl<$Res>
    extends _$NotificationValueCopyWithImpl<$Res>
    implements _$NotificationValueCopyWith<$Res> {
  __$NotificationValueCopyWithImpl(
      _NotificationValue _value, $Res Function(_NotificationValue) _then)
      : super(_value, (v) => _then(v as _NotificationValue));

  @override
  _NotificationValue get _value => super._value as _NotificationValue;

  @override
  $Res call({
    Object? notificationID = freezed,
    Object? weekID = freezed,
    Object? setting = freezed,
    Object? title = freezed,
    Object? comment = freezed,
    Object? payload = freezed,
    Object? loopFlag = freezed,
  }) {
    return _then(_NotificationValue(
      notificationID: notificationID == freezed
          ? _value.notificationID
          : notificationID // ignore: cast_nullable_to_non_nullable
              as int,
      weekID: weekID == freezed
          ? _value.weekID
          : weekID // ignore: cast_nullable_to_non_nullable
              as int,
      setting: setting == freezed
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      loopFlag: loopFlag == freezed
          ? _value.loopFlag
          : loopFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotificationValue extends _NotificationValue
    with DiagnosticableTreeMixin {
  const _$_NotificationValue(
      {required this.notificationID,
      required this.weekID,
      required this.setting,
      required this.title,
      required this.comment,
      required this.payload,
      required this.loopFlag})
      : super._();

  @override
  final int notificationID;
  @override
  final int weekID;
  @override
  final UserSettings setting;
  @override
  final String title;
  @override
  final String comment;
  @override
  final String payload;
  @override
  final bool loopFlag;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationValue(notificationID: $notificationID, weekID: $weekID, setting: $setting, title: $title, comment: $comment, payload: $payload, loopFlag: $loopFlag)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationValue'))
      ..add(DiagnosticsProperty('notificationID', notificationID))
      ..add(DiagnosticsProperty('weekID', weekID))
      ..add(DiagnosticsProperty('setting', setting))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('payload', payload))
      ..add(DiagnosticsProperty('loopFlag', loopFlag));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationValue &&
            const DeepCollectionEquality()
                .equals(other.notificationID, notificationID) &&
            const DeepCollectionEquality().equals(other.weekID, weekID) &&
            const DeepCollectionEquality().equals(other.setting, setting) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            const DeepCollectionEquality().equals(other.loopFlag, loopFlag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(notificationID),
      const DeepCollectionEquality().hash(weekID),
      const DeepCollectionEquality().hash(setting),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(payload),
      const DeepCollectionEquality().hash(loopFlag));

  @JsonKey(ignore: true)
  @override
  _$NotificationValueCopyWith<_NotificationValue> get copyWith =>
      __$NotificationValueCopyWithImpl<_NotificationValue>(this, _$identity);
}

abstract class _NotificationValue extends NotificationValue {
  const factory _NotificationValue(
      {required int notificationID,
      required int weekID,
      required UserSettings setting,
      required String title,
      required String comment,
      required String payload,
      required bool loopFlag}) = _$_NotificationValue;
  const _NotificationValue._() : super._();

  @override
  int get notificationID;
  @override
  int get weekID;
  @override
  UserSettings get setting;
  @override
  String get title;
  @override
  String get comment;
  @override
  String get payload;
  @override
  bool get loopFlag;
  @override
  @JsonKey(ignore: true)
  _$NotificationValueCopyWith<_NotificationValue> get copyWith =>
      throw _privateConstructorUsedError;
}
