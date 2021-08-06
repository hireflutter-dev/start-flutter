// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'github_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GithubUser _$GithubUserFromJson(Map<String, dynamic> json) {
  return _GithubUser.fromJson(json);
}

/// @nodoc
class _$GithubUserTearOff {
  const _$GithubUserTearOff();

  _GithubUser call(
      {int? id, String? login, String? avatar_url, String? organizations_url}) {
    return _GithubUser(
      id: id,
      login: login,
      avatar_url: avatar_url,
      organizations_url: organizations_url,
    );
  }

  GithubUser fromJson(Map<String, Object> json) {
    return GithubUser.fromJson(json);
  }
}

/// @nodoc
const $GithubUser = _$GithubUserTearOff();

/// @nodoc
mixin _$GithubUser {
  int? get id => throw _privateConstructorUsedError;
  String? get login => throw _privateConstructorUsedError;
  String? get avatar_url => throw _privateConstructorUsedError;
  String? get organizations_url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GithubUserCopyWith<GithubUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubUserCopyWith<$Res> {
  factory $GithubUserCopyWith(
          GithubUser value, $Res Function(GithubUser) then) =
      _$GithubUserCopyWithImpl<$Res>;
  $Res call(
      {int? id, String? login, String? avatar_url, String? organizations_url});
}

/// @nodoc
class _$GithubUserCopyWithImpl<$Res> implements $GithubUserCopyWith<$Res> {
  _$GithubUserCopyWithImpl(this._value, this._then);

  final GithubUser _value;
  // ignore: unused_field
  final $Res Function(GithubUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? login = freezed,
    Object? avatar_url = freezed,
    Object? organizations_url = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      organizations_url: organizations_url == freezed
          ? _value.organizations_url
          : organizations_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GithubUserCopyWith<$Res> implements $GithubUserCopyWith<$Res> {
  factory _$GithubUserCopyWith(
          _GithubUser value, $Res Function(_GithubUser) then) =
      __$GithubUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id, String? login, String? avatar_url, String? organizations_url});
}

/// @nodoc
class __$GithubUserCopyWithImpl<$Res> extends _$GithubUserCopyWithImpl<$Res>
    implements _$GithubUserCopyWith<$Res> {
  __$GithubUserCopyWithImpl(
      _GithubUser _value, $Res Function(_GithubUser) _then)
      : super(_value, (v) => _then(v as _GithubUser));

  @override
  _GithubUser get _value => super._value as _GithubUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? login = freezed,
    Object? avatar_url = freezed,
    Object? organizations_url = freezed,
  }) {
    return _then(_GithubUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar_url: avatar_url == freezed
          ? _value.avatar_url
          : avatar_url // ignore: cast_nullable_to_non_nullable
              as String?,
      organizations_url: organizations_url == freezed
          ? _value.organizations_url
          : organizations_url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GithubUser implements _GithubUser {
  _$_GithubUser({this.id, this.login, this.avatar_url, this.organizations_url});

  factory _$_GithubUser.fromJson(Map<String, dynamic> json) =>
      _$_$_GithubUserFromJson(json);

  @override
  final int? id;
  @override
  final String? login;
  @override
  final String? avatar_url;
  @override
  final String? organizations_url;

  @override
  String toString() {
    return 'GithubUser(id: $id, login: $login, avatar_url: $avatar_url, organizations_url: $organizations_url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GithubUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.login, login) ||
                const DeepCollectionEquality().equals(other.login, login)) &&
            (identical(other.avatar_url, avatar_url) ||
                const DeepCollectionEquality()
                    .equals(other.avatar_url, avatar_url)) &&
            (identical(other.organizations_url, organizations_url) ||
                const DeepCollectionEquality()
                    .equals(other.organizations_url, organizations_url)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(login) ^
      const DeepCollectionEquality().hash(avatar_url) ^
      const DeepCollectionEquality().hash(organizations_url);

  @JsonKey(ignore: true)
  @override
  _$GithubUserCopyWith<_GithubUser> get copyWith =>
      __$GithubUserCopyWithImpl<_GithubUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GithubUserToJson(this);
  }
}

abstract class _GithubUser implements GithubUser {
  factory _GithubUser(
      {int? id,
      String? login,
      String? avatar_url,
      String? organizations_url}) = _$_GithubUser;

  factory _GithubUser.fromJson(Map<String, dynamic> json) =
      _$_GithubUser.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get login => throw _privateConstructorUsedError;
  @override
  String? get avatar_url => throw _privateConstructorUsedError;
  @override
  String? get organizations_url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GithubUserCopyWith<_GithubUser> get copyWith =>
      throw _privateConstructorUsedError;
}
