// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Event {
  @HiveField(0)
  String get uuid => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @HiveField(3)
  String get location => throw _privateConstructorUsedError;
  @HiveField(4)
  String get description => throw _privateConstructorUsedError;
  @HiveField(5)
  String get imagePath => throw _privateConstructorUsedError;
  @HiveField(6)
  List<Subtask> get subtasks => throw _privateConstructorUsedError;
  @HiveField(7)
  List<Guest> get guests => throw _privateConstructorUsedError;
  @HiveField(8)
  List<Expense> get expenses => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String title,
      @HiveField(2) DateTime dateTime,
      @HiveField(3) String location,
      @HiveField(4) String description,
      @HiveField(5) String imagePath,
      @HiveField(6) List<Subtask> subtasks,
      @HiveField(7) List<Guest> guests,
      @HiveField(8) List<Expense> expenses});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? dateTime = null,
    Object? location = null,
    Object? description = null,
    Object? imagePath = null,
    Object? subtasks = null,
    Object? guests = null,
    Object? expenses = null,
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
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: null == subtasks
          ? _value.subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<Subtask>,
      guests: null == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String uuid,
      @HiveField(1) String title,
      @HiveField(2) DateTime dateTime,
      @HiveField(3) String location,
      @HiveField(4) String description,
      @HiveField(5) String imagePath,
      @HiveField(6) List<Subtask> subtasks,
      @HiveField(7) List<Guest> guests,
      @HiveField(8) List<Expense> expenses});
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? title = null,
    Object? dateTime = null,
    Object? location = null,
    Object? description = null,
    Object? imagePath = null,
    Object? subtasks = null,
    Object? guests = null,
    Object? expenses = null,
  }) {
    return _then(_$EventImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      subtasks: null == subtasks
          ? _value._subtasks
          : subtasks // ignore: cast_nullable_to_non_nullable
              as List<Subtask>,
      guests: null == guests
          ? _value._guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Expense>,
    ));
  }
}

/// @nodoc

class _$EventImpl implements _Event {
  const _$EventImpl(
      {@HiveField(0) required this.uuid,
      @HiveField(1) required this.title,
      @HiveField(2) required this.dateTime,
      @HiveField(3) required this.location,
      @HiveField(4) required this.description,
      @HiveField(5) required this.imagePath,
      @HiveField(6) required final List<Subtask> subtasks,
      @HiveField(7) required final List<Guest> guests,
      @HiveField(8) required final List<Expense> expenses})
      : _subtasks = subtasks,
        _guests = guests,
        _expenses = expenses;

  @override
  @HiveField(0)
  final String uuid;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final DateTime dateTime;
  @override
  @HiveField(3)
  final String location;
  @override
  @HiveField(4)
  final String description;
  @override
  @HiveField(5)
  final String imagePath;
  final List<Subtask> _subtasks;
  @override
  @HiveField(6)
  List<Subtask> get subtasks {
    if (_subtasks is EqualUnmodifiableListView) return _subtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtasks);
  }

  final List<Guest> _guests;
  @override
  @HiveField(7)
  List<Guest> get guests {
    if (_guests is EqualUnmodifiableListView) return _guests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_guests);
  }

  final List<Expense> _expenses;
  @override
  @HiveField(8)
  List<Expense> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  String toString() {
    return 'Event(uuid: $uuid, title: $title, dateTime: $dateTime, location: $location, description: $description, imagePath: $imagePath, subtasks: $subtasks, guests: $guests, expenses: $expenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._subtasks, _subtasks) &&
            const DeepCollectionEquality().equals(other._guests, _guests) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      title,
      dateTime,
      location,
      description,
      imagePath,
      const DeepCollectionEquality().hash(_subtasks),
      const DeepCollectionEquality().hash(_guests),
      const DeepCollectionEquality().hash(_expenses));

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);
}

abstract class _Event implements Event {
  const factory _Event(
      {@HiveField(0) required final String uuid,
      @HiveField(1) required final String title,
      @HiveField(2) required final DateTime dateTime,
      @HiveField(3) required final String location,
      @HiveField(4) required final String description,
      @HiveField(5) required final String imagePath,
      @HiveField(6) required final List<Subtask> subtasks,
      @HiveField(7) required final List<Guest> guests,
      @HiveField(8) required final List<Expense> expenses}) = _$EventImpl;

  @override
  @HiveField(0)
  String get uuid;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  DateTime get dateTime;
  @override
  @HiveField(3)
  String get location;
  @override
  @HiveField(4)
  String get description;
  @override
  @HiveField(5)
  String get imagePath;
  @override
  @HiveField(6)
  List<Subtask> get subtasks;
  @override
  @HiveField(7)
  List<Guest> get guests;
  @override
  @HiveField(8)
  List<Expense> get expenses;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
