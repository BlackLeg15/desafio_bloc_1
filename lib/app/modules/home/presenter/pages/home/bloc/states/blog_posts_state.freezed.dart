// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlogPostsStateFreezed {
  List<BlogPostEntity> get posts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BlogPostEntity> posts, int page) initial,
    required TResult Function(List<BlogPostEntity> posts, int page) loading,
    required TResult Function(
            List<BlogPostEntity> posts, int page, String message)
        exception,
    required TResult Function(List<BlogPostEntity> posts, int page) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BlogPostEntity> posts, int page)? initial,
    TResult? Function(List<BlogPostEntity> posts, int page)? loading,
    TResult? Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult? Function(List<BlogPostEntity> posts, int page)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BlogPostEntity> posts, int page)? initial,
    TResult Function(List<BlogPostEntity> posts, int page)? loading,
    TResult Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult Function(List<BlogPostEntity> posts, int page)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Exception value) exception,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Exception value)? exception,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Exception value)? exception,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogPostsStateFreezedCopyWith<BlogPostsStateFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogPostsStateFreezedCopyWith<$Res> {
  factory $BlogPostsStateFreezedCopyWith(BlogPostsStateFreezed value,
          $Res Function(BlogPostsStateFreezed) then) =
      _$BlogPostsStateFreezedCopyWithImpl<$Res, BlogPostsStateFreezed>;
  @useResult
  $Res call({List<BlogPostEntity> posts, int page});
}

/// @nodoc
class _$BlogPostsStateFreezedCopyWithImpl<$Res,
        $Val extends BlogPostsStateFreezed>
    implements $BlogPostsStateFreezedCopyWith<$Res> {
  _$BlogPostsStateFreezedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPostEntity>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BlogPostsStateFreezedCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogPostEntity> posts, int page});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BlogPostsStateFreezedCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
  }) {
    return _then(_$InitialImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPostEntity>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(final List<BlogPostEntity> posts,
      {this.page = FetchBlogPostsParameters.initialPage})
      : _posts = posts;

  final List<BlogPostEntity> _posts;
  @override
  List<BlogPostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'BlogPostsStateFreezed.initial(posts: $posts, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BlogPostEntity> posts, int page) initial,
    required TResult Function(List<BlogPostEntity> posts, int page) loading,
    required TResult Function(
            List<BlogPostEntity> posts, int page, String message)
        exception,
    required TResult Function(List<BlogPostEntity> posts, int page) success,
  }) {
    return initial(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BlogPostEntity> posts, int page)? initial,
    TResult? Function(List<BlogPostEntity> posts, int page)? loading,
    TResult? Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult? Function(List<BlogPostEntity> posts, int page)? success,
  }) {
    return initial?.call(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BlogPostEntity> posts, int page)? initial,
    TResult Function(List<BlogPostEntity> posts, int page)? loading,
    TResult Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult Function(List<BlogPostEntity> posts, int page)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(posts, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Exception value) exception,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Exception value)? exception,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Exception value)? exception,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements BlogPostsStateFreezed {
  const factory Initial(final List<BlogPostEntity> posts, {final int page}) =
      _$InitialImpl;

  @override
  List<BlogPostEntity> get posts;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $BlogPostsStateFreezedCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogPostEntity> posts, int page});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BlogPostsStateFreezedCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
  }) {
    return _then(_$LoadingImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPostEntity>,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl(final List<BlogPostEntity> posts, this.page)
      : _posts = posts;

  final List<BlogPostEntity> _posts;
  @override
  List<BlogPostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'BlogPostsStateFreezed.loading(posts: $posts, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BlogPostEntity> posts, int page) initial,
    required TResult Function(List<BlogPostEntity> posts, int page) loading,
    required TResult Function(
            List<BlogPostEntity> posts, int page, String message)
        exception,
    required TResult Function(List<BlogPostEntity> posts, int page) success,
  }) {
    return loading(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BlogPostEntity> posts, int page)? initial,
    TResult? Function(List<BlogPostEntity> posts, int page)? loading,
    TResult? Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult? Function(List<BlogPostEntity> posts, int page)? success,
  }) {
    return loading?.call(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BlogPostEntity> posts, int page)? initial,
    TResult Function(List<BlogPostEntity> posts, int page)? loading,
    TResult Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult Function(List<BlogPostEntity> posts, int page)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(posts, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Exception value) exception,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Exception value)? exception,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Exception value)? exception,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements BlogPostsStateFreezed {
  const factory Loading(final List<BlogPostEntity> posts, final int page) =
      _$LoadingImpl;

  @override
  List<BlogPostEntity> get posts;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExceptionImplCopyWith<$Res>
    implements $BlogPostsStateFreezedCopyWith<$Res> {
  factory _$$ExceptionImplCopyWith(
          _$ExceptionImpl value, $Res Function(_$ExceptionImpl) then) =
      __$$ExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogPostEntity> posts, int page, String message});
}

/// @nodoc
class __$$ExceptionImplCopyWithImpl<$Res>
    extends _$BlogPostsStateFreezedCopyWithImpl<$Res, _$ExceptionImpl>
    implements _$$ExceptionImplCopyWith<$Res> {
  __$$ExceptionImplCopyWithImpl(
      _$ExceptionImpl _value, $Res Function(_$ExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
    Object? message = null,
  }) {
    return _then(_$ExceptionImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPostEntity>,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExceptionImpl implements Exception {
  const _$ExceptionImpl(
      final List<BlogPostEntity> posts, this.page, this.message)
      : _posts = posts;

  final List<BlogPostEntity> _posts;
  @override
  List<BlogPostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final int page;
  @override
  final String message;

  @override
  String toString() {
    return 'BlogPostsStateFreezed.exception(posts: $posts, page: $page, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExceptionImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), page, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      __$$ExceptionImplCopyWithImpl<_$ExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BlogPostEntity> posts, int page) initial,
    required TResult Function(List<BlogPostEntity> posts, int page) loading,
    required TResult Function(
            List<BlogPostEntity> posts, int page, String message)
        exception,
    required TResult Function(List<BlogPostEntity> posts, int page) success,
  }) {
    return exception(posts, page, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BlogPostEntity> posts, int page)? initial,
    TResult? Function(List<BlogPostEntity> posts, int page)? loading,
    TResult? Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult? Function(List<BlogPostEntity> posts, int page)? success,
  }) {
    return exception?.call(posts, page, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BlogPostEntity> posts, int page)? initial,
    TResult Function(List<BlogPostEntity> posts, int page)? loading,
    TResult Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult Function(List<BlogPostEntity> posts, int page)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(posts, page, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Exception value) exception,
    required TResult Function(Success value) success,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Exception value)? exception,
    TResult? Function(Success value)? success,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Exception value)? exception,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class Exception implements BlogPostsStateFreezed {
  const factory Exception(final List<BlogPostEntity> posts, final int page,
      final String message) = _$ExceptionImpl;

  @override
  List<BlogPostEntity> get posts;
  @override
  int get page;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ExceptionImplCopyWith<_$ExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res>
    implements $BlogPostsStateFreezedCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlogPostEntity> posts, int page});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$BlogPostsStateFreezedCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
    Object? page = null,
  }) {
    return _then(_$SuccessImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<BlogPostEntity>,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(final List<BlogPostEntity> posts, this.page)
      : _posts = posts;

  final List<BlogPostEntity> _posts;
  @override
  List<BlogPostEntity> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final int page;

  @override
  String toString() {
    return 'BlogPostsStateFreezed.success(posts: $posts, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_posts), page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BlogPostEntity> posts, int page) initial,
    required TResult Function(List<BlogPostEntity> posts, int page) loading,
    required TResult Function(
            List<BlogPostEntity> posts, int page, String message)
        exception,
    required TResult Function(List<BlogPostEntity> posts, int page) success,
  }) {
    return success(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BlogPostEntity> posts, int page)? initial,
    TResult? Function(List<BlogPostEntity> posts, int page)? loading,
    TResult? Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult? Function(List<BlogPostEntity> posts, int page)? success,
  }) {
    return success?.call(posts, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BlogPostEntity> posts, int page)? initial,
    TResult Function(List<BlogPostEntity> posts, int page)? loading,
    TResult Function(List<BlogPostEntity> posts, int page, String message)?
        exception,
    TResult Function(List<BlogPostEntity> posts, int page)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(posts, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Exception value) exception,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Exception value)? exception,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Exception value)? exception,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements BlogPostsStateFreezed {
  const factory Success(final List<BlogPostEntity> posts, final int page) =
      _$SuccessImpl;

  @override
  List<BlogPostEntity> get posts;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
