// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Subtask {
  @HiveField(0)
  String get uuid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime? get date => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  SubtaskPriority? get priority => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get done => throw _privateConstructorUsedError;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskCopyWith<Subtask> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskCopyWith<$Res> {
  factory $SubtaskCopyWith(Subtask value, $Res Function(Subtask) then) =
      _$SubtaskCopyWithImpl<$Res, Subtask>;
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String title,
      @HiveField(2) DateTime? date,
      @HiveField(3) String description,
      @HiveField(4) SubtaskPriority? priority,
      @HiveField(5) bool done});
}

/// @nodoc
class _$SubtaskCopyWithImpl<$Res, $Val extends Subtask>
    implements $SubtaskCopyWith<$Res> {
  _$SubtaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? date = freezed,
    Object? description = null,
    Object? priority = freezed,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as SubtaskPriority?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubtaskImplCopyWith<$Res> implements $SubtaskCopyWith<$Res> {
  factory _$$SubtaskImplCopyWith(
          _$SubtaskImpl value, $Res Function(_$SubtaskImpl) then) =
      __$$SubtaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String title,
      @HiveField(2) DateTime? date,
      @HiveField(3) String description,
      @HiveField(4) SubtaskPriority? priority,
      @HiveField(5) bool done});
}

/// @nodoc
class __$$SubtaskImplCopyWithImpl<$Res>
    extends _$SubtaskCopyWithImpl<$Res, _$SubtaskImpl>
    implements _$$SubtaskImplCopyWith<$Res> {
  __$$SubtaskImplCopyWithImpl(
      _$SubtaskImpl _value, $Res Function(_$SubtaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? date = freezed,
    Object? description = null,
    Object? priority = freezed,
    Object? done = null,
  }) {
    return _then(_$SubtaskImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as SubtaskPriority?,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SubtaskImpl implements _Subtask {
  const _$SubtaskImpl(
      {@HiveField(0) required this.uuid,
      @HiveField(1) required this.title,
      @HiveField(2) this.date,
      @HiveField(3) required this.description,
      @HiveField(4) this.priority,
      @HiveField(5) required this.done});

  @override
  @HiveField(0)
  final String uuid;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final DateTime? date;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final SubtaskPriority? priority;
  @override
  @HiveField(5)
  final bool done;

  @override
  String toString() {
    return 'Subtask(uuid: $uuid, title: $title, date: $date, description: $description, priority: $priority, done: $done)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.done, done) || other.done == done));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, uuid, title, date, description, priority, done);

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskImplCopyWith<_$SubtaskImpl> get copyWith =>
      __$$SubtaskImplCopyWithImpl<_$SubtaskImpl>(this, _$identity);
}

abstract class _Subtask implements Subtask {
  const factory _Subtask(
      {@HiveField(0) required final String uuid,
      @HiveField(1) required final String title,
      @HiveField(2) final DateTime? date,
      @HiveField(3) required final String description,
      @HiveField(4) final SubtaskPriority? priority,
      @HiveField(5) required final bool done}) = _$SubtaskImpl;

  @override
  @HiveField(0)
  String get uuid;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  DateTime? get date;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  SubtaskPriority? get priority;
  @override
  @HiveField(5)
  bool get done;

  /// Create a copy of Subtask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskImplCopyWith<_$SubtaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
