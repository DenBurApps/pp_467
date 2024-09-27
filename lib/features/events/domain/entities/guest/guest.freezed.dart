// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Guest {
  @HiveField(0)
  String get uuid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get contacts => throw _privateConstructorUsedError;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String name,
      @HiveField(2) String contacts});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? contacts = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GuestImplCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$GuestImplCopyWith(
          _$GuestImpl value, $Res Function(_$GuestImpl) then) =
      __$$GuestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String name,
      @HiveField(2) String contacts});
}

/// @nodoc
class __$$GuestImplCopyWithImpl<$Res>
    extends _$GuestCopyWithImpl<$Res, _$GuestImpl>
    implements _$$GuestImplCopyWith<$Res> {
  __$$GuestImplCopyWithImpl(
      _$GuestImpl _value, $Res Function(_$GuestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = null,
    Object? contacts = null,
  }) {
    return _then(_$GuestImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GuestImpl implements _Guest {
  const _$GuestImpl(
      {@HiveField(0) required this.uuid,
      @HiveField(1) required this.name,
      @HiveField(2) required this.contacts});

  @override
  @HiveField(0)
  final String uuid;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String contacts;

  @override
  String toString() {
    return 'Guest(uuid: $uuid, name: $name, contacts: $contacts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GuestImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contacts, contacts) ||
                other.contacts == contacts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, contacts);

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      __$$GuestImplCopyWithImpl<_$GuestImpl>(this, _$identity);
}

abstract class _Guest implements Guest {
  const factory _Guest(
      {@HiveField(0) required final String uuid,
      @HiveField(1) required final String name,
      @HiveField(2) required final String contacts}) = _$GuestImpl;

  @override
  @HiveField(0)
  String get uuid;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get contacts;

  /// Create a copy of Guest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GuestImplCopyWith<_$GuestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
