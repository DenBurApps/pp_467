// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ArticleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Article> articles) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Article> articles)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleLoaded value) loaded,
    required TResult Function(ArticleError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleLoaded value)? loaded,
    TResult? Function(ArticleError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleLoaded value)? loaded,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleStateCopyWith<$Res> {
  factory $ArticleStateCopyWith(
          ArticleState value, $Res Function(ArticleState) then) =
      _$ArticleStateCopyWithImpl<$Res, ArticleState>;
}

/// @nodoc
class _$ArticleStateCopyWithImpl<$Res, $Val extends ArticleState>
    implements $ArticleStateCopyWith<$Res> {
  _$ArticleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ArticleLoadingImplCopyWith<$Res> {
  factory _$$ArticleLoadingImplCopyWith(_$ArticleLoadingImpl value,
          $Res Function(_$ArticleLoadingImpl) then) =
      __$$ArticleLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArticleLoadingImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleLoadingImpl>
    implements _$$ArticleLoadingImplCopyWith<$Res> {
  __$$ArticleLoadingImplCopyWithImpl(
      _$ArticleLoadingImpl _value, $Res Function(_$ArticleLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ArticleLoadingImpl implements ArticleLoading {
  const _$ArticleLoadingImpl();

  @override
  String toString() {
    return 'ArticleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ArticleLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Article> articles) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Article> articles)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleLoaded value) loaded,
    required TResult Function(ArticleError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleLoaded value)? loaded,
    TResult? Function(ArticleError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleLoaded value)? loaded,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ArticleLoading implements ArticleState {
  const factory ArticleLoading() = _$ArticleLoadingImpl;
}

/// @nodoc
abstract class _$$ArticleLoadedImplCopyWith<$Res> {
  factory _$$ArticleLoadedImplCopyWith(
          _$ArticleLoadedImpl value, $Res Function(_$ArticleLoadedImpl) then) =
      __$$ArticleLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Article> articles});
}

/// @nodoc
class __$$ArticleLoadedImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleLoadedImpl>
    implements _$$ArticleLoadedImplCopyWith<$Res> {
  __$$ArticleLoadedImplCopyWithImpl(
      _$ArticleLoadedImpl _value, $Res Function(_$ArticleLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$ArticleLoadedImpl(
      null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$ArticleLoadedImpl implements ArticleLoaded {
  const _$ArticleLoadedImpl(final List<Article> articles)
      : _articles = articles;

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'ArticleState.loaded(articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleLoadedImpl &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleLoadedImplCopyWith<_$ArticleLoadedImpl> get copyWith =>
      __$$ArticleLoadedImplCopyWithImpl<_$ArticleLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Article> articles) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(articles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(articles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Article> articles)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(articles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleLoaded value) loaded,
    required TResult Function(ArticleError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleLoaded value)? loaded,
    TResult? Function(ArticleError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleLoaded value)? loaded,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ArticleLoaded implements ArticleState {
  const factory ArticleLoaded(final List<Article> articles) =
      _$ArticleLoadedImpl;

  List<Article> get articles;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleLoadedImplCopyWith<_$ArticleLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArticleErrorImplCopyWith<$Res> {
  factory _$$ArticleErrorImplCopyWith(
          _$ArticleErrorImpl value, $Res Function(_$ArticleErrorImpl) then) =
      __$$ArticleErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ArticleErrorImplCopyWithImpl<$Res>
    extends _$ArticleStateCopyWithImpl<$Res, _$ArticleErrorImpl>
    implements _$$ArticleErrorImplCopyWith<$Res> {
  __$$ArticleErrorImplCopyWithImpl(
      _$ArticleErrorImpl _value, $Res Function(_$ArticleErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ArticleErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ArticleErrorImpl implements ArticleError {
  const _$ArticleErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ArticleState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleErrorImplCopyWith<_$ArticleErrorImpl> get copyWith =>
      __$$ArticleErrorImplCopyWithImpl<_$ArticleErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Article> articles) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Article> articles)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Article> articles)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticleLoading value) loading,
    required TResult Function(ArticleLoaded value) loaded,
    required TResult Function(ArticleError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticleLoading value)? loading,
    TResult? Function(ArticleLoaded value)? loaded,
    TResult? Function(ArticleError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticleLoading value)? loading,
    TResult Function(ArticleLoaded value)? loaded,
    TResult Function(ArticleError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ArticleError implements ArticleState {
  const factory ArticleError(final String message) = _$ArticleErrorImpl;

  String get message;

  /// Create a copy of ArticleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleErrorImplCopyWith<_$ArticleErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
