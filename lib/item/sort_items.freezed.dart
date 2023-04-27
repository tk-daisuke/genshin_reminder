// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sort_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SortItemsTearOff {
  const _$SortItemsTearOff();

  _SortItems call({required NotificationPayload payload, required int id}) {
    return _SortItems(
      payload: payload,
      id: id,
    );
  }
}

/// @nodoc
const $SortItems = _$SortItemsTearOff();

/// @nodoc
mixin _$SortItems {
  NotificationPayload get payload => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortItemsCopyWith<SortItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortItemsCopyWith<$Res> {
  factory $SortItemsCopyWith(SortItems value, $Res Function(SortItems) then) =
      _$SortItemsCopyWithImpl<$Res>;
  $Res call({NotificationPayload payload, int id});

  $NotificationPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class _$SortItemsCopyWithImpl<$Res> implements $SortItemsCopyWith<$Res> {
  _$SortItemsCopyWithImpl(this._value, this._then);

  final SortItems _value;
  // ignore: unused_field
  final $Res Function(SortItems) _then;

  @override
  $Res call({
    Object? payload = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as NotificationPayload,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $NotificationPayloadCopyWith<$Res> get payload {
    return $NotificationPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
abstract class _$SortItemsCopyWith<$Res> implements $SortItemsCopyWith<$Res> {
  factory _$SortItemsCopyWith(
          _SortItems value, $Res Function(_SortItems) then) =
      __$SortItemsCopyWithImpl<$Res>;
  @override
  $Res call({NotificationPayload payload, int id});

  @override
  $NotificationPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$SortItemsCopyWithImpl<$Res> extends _$SortItemsCopyWithImpl<$Res>
    implements _$SortItemsCopyWith<$Res> {
  __$SortItemsCopyWithImpl(_SortItems _value, $Res Function(_SortItems) _then)
      : super(_value, (v) => _then(v as _SortItems));

  @override
  _SortItems get _value => super._value as _SortItems;

  @override
  $Res call({
    Object? payload = freezed,
    Object? id = freezed,
  }) {
    return _then(_SortItems(
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as NotificationPayload,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SortItems extends _SortItems with DiagnosticableTreeMixin {
  const _$_SortItems({required this.payload, required this.id}) : super._();

  @override
  final NotificationPayload payload;
  @override
  final int id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SortItems(payload: $payload, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SortItems'))
      ..add(DiagnosticsProperty('payload', payload))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SortItems &&
            const DeepCollectionEquality().equals(other.payload, payload) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(payload),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$SortItemsCopyWith<_SortItems> get copyWith =>
      __$SortItemsCopyWithImpl<_SortItems>(this, _$identity);
}

abstract class _SortItems extends SortItems {
  const factory _SortItems(
      {required NotificationPayload payload, required int id}) = _$_SortItems;
  const _SortItems._() : super._();

  @override
  NotificationPayload get payload;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$SortItemsCopyWith<_SortItems> get copyWith =>
      throw _privateConstructorUsedError;
}
