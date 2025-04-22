// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PictureMetadata {
  String get id => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureMetadataCopyWith<PictureMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureMetadataCopyWith<$Res> {
  factory $PictureMetadataCopyWith(
          PictureMetadata value, $Res Function(PictureMetadata) then) =
      _$PictureMetadataCopyWithImpl<$Res, PictureMetadata>;
  @useResult
  $Res call({String id, String key, String createdAt});
}

/// @nodoc
class _$PictureMetadataCopyWithImpl<$Res, $Val extends PictureMetadata>
    implements $PictureMetadataCopyWith<$Res> {
  _$PictureMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureMetadataImplCopyWith<$Res>
    implements $PictureMetadataCopyWith<$Res> {
  factory _$$PictureMetadataImplCopyWith(_$PictureMetadataImpl value,
          $Res Function(_$PictureMetadataImpl) then) =
      __$$PictureMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String key, String createdAt});
}

/// @nodoc
class __$$PictureMetadataImplCopyWithImpl<$Res>
    extends _$PictureMetadataCopyWithImpl<$Res, _$PictureMetadataImpl>
    implements _$$PictureMetadataImplCopyWith<$Res> {
  __$$PictureMetadataImplCopyWithImpl(
      _$PictureMetadataImpl _value, $Res Function(_$PictureMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? key = null,
    Object? createdAt = null,
  }) {
    return _then(_$PictureMetadataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PictureMetadataImpl implements _PictureMetadata {
  const _$PictureMetadataImpl(
      {required this.id, required this.key, required this.createdAt});

  @override
  final String id;
  @override
  final String key;
  @override
  final String createdAt;

  @override
  String toString() {
    return 'PictureMetadata(id: $id, key: $key, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureMetadataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, key, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureMetadataImplCopyWith<_$PictureMetadataImpl> get copyWith =>
      __$$PictureMetadataImplCopyWithImpl<_$PictureMetadataImpl>(
          this, _$identity);
}

abstract class _PictureMetadata implements PictureMetadata {
  const factory _PictureMetadata(
      {required final String id,
      required final String key,
      required final String createdAt}) = _$PictureMetadataImpl;

  @override
  String get id;
  @override
  String get key;
  @override
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PictureMetadataImplCopyWith<_$PictureMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PictureMetadataConnection {
  List<PictureMetadata> get items => throw _privateConstructorUsedError;
  String? get nextToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureMetadataConnectionCopyWith<PictureMetadataConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureMetadataConnectionCopyWith<$Res> {
  factory $PictureMetadataConnectionCopyWith(PictureMetadataConnection value,
          $Res Function(PictureMetadataConnection) then) =
      _$PictureMetadataConnectionCopyWithImpl<$Res, PictureMetadataConnection>;
  @useResult
  $Res call({List<PictureMetadata> items, String? nextToken});
}

/// @nodoc
class _$PictureMetadataConnectionCopyWithImpl<$Res,
        $Val extends PictureMetadataConnection>
    implements $PictureMetadataConnectionCopyWith<$Res> {
  _$PictureMetadataConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextToken = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PictureMetadata>,
      nextToken: freezed == nextToken
          ? _value.nextToken
          : nextToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureMetadataConnectionImplCopyWith<$Res>
    implements $PictureMetadataConnectionCopyWith<$Res> {
  factory _$$PictureMetadataConnectionImplCopyWith(
          _$PictureMetadataConnectionImpl value,
          $Res Function(_$PictureMetadataConnectionImpl) then) =
      __$$PictureMetadataConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PictureMetadata> items, String? nextToken});
}

/// @nodoc
class __$$PictureMetadataConnectionImplCopyWithImpl<$Res>
    extends _$PictureMetadataConnectionCopyWithImpl<$Res,
        _$PictureMetadataConnectionImpl>
    implements _$$PictureMetadataConnectionImplCopyWith<$Res> {
  __$$PictureMetadataConnectionImplCopyWithImpl(
      _$PictureMetadataConnectionImpl _value,
      $Res Function(_$PictureMetadataConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextToken = freezed,
  }) {
    return _then(_$PictureMetadataConnectionImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PictureMetadata>,
      nextToken: freezed == nextToken
          ? _value.nextToken
          : nextToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PictureMetadataConnectionImpl implements _PictureMetadataConnection {
  const _$PictureMetadataConnectionImpl(
      {required final List<PictureMetadata> items, this.nextToken})
      : _items = items;

  final List<PictureMetadata> _items;
  @override
  List<PictureMetadata> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? nextToken;

  @override
  String toString() {
    return 'PictureMetadataConnection(items: $items, nextToken: $nextToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureMetadataConnectionImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextToken, nextToken) ||
                other.nextToken == nextToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), nextToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureMetadataConnectionImplCopyWith<_$PictureMetadataConnectionImpl>
      get copyWith => __$$PictureMetadataConnectionImplCopyWithImpl<
          _$PictureMetadataConnectionImpl>(this, _$identity);
}

abstract class _PictureMetadataConnection implements PictureMetadataConnection {
  const factory _PictureMetadataConnection(
      {required final List<PictureMetadata> items,
      final String? nextToken}) = _$PictureMetadataConnectionImpl;

  @override
  List<PictureMetadata> get items;
  @override
  String? get nextToken;
  @override
  @JsonKey(ignore: true)
  _$$PictureMetadataConnectionImplCopyWith<_$PictureMetadataConnectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
