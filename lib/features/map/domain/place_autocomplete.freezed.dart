// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_autocomplete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceAutocomplete {
  String get placeId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get mainText => throw _privateConstructorUsedError;
  String get secondaryText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceAutocompleteCopyWith<PlaceAutocomplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAutocompleteCopyWith<$Res> {
  factory $PlaceAutocompleteCopyWith(
          PlaceAutocomplete value, $Res Function(PlaceAutocomplete) then) =
      _$PlaceAutocompleteCopyWithImpl<$Res, PlaceAutocomplete>;
  @useResult
  $Res call(
      {String placeId,
      String description,
      String mainText,
      String secondaryText});
}

/// @nodoc
class _$PlaceAutocompleteCopyWithImpl<$Res, $Val extends PlaceAutocomplete>
    implements $PlaceAutocompleteCopyWith<$Res> {
  _$PlaceAutocompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? mainText = null,
    Object? secondaryText = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainText: null == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryText: null == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceAutocompleteCopyWith<$Res>
    implements $PlaceAutocompleteCopyWith<$Res> {
  factory _$$_PlaceAutocompleteCopyWith(_$_PlaceAutocomplete value,
          $Res Function(_$_PlaceAutocomplete) then) =
      __$$_PlaceAutocompleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String placeId,
      String description,
      String mainText,
      String secondaryText});
}

/// @nodoc
class __$$_PlaceAutocompleteCopyWithImpl<$Res>
    extends _$PlaceAutocompleteCopyWithImpl<$Res, _$_PlaceAutocomplete>
    implements _$$_PlaceAutocompleteCopyWith<$Res> {
  __$$_PlaceAutocompleteCopyWithImpl(
      _$_PlaceAutocomplete _value, $Res Function(_$_PlaceAutocomplete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? mainText = null,
    Object? secondaryText = null,
  }) {
    return _then(_$_PlaceAutocomplete(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mainText: null == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String,
      secondaryText: null == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PlaceAutocomplete implements _PlaceAutocomplete {
  const _$_PlaceAutocomplete(
      {required this.placeId,
      required this.description,
      required this.mainText,
      required this.secondaryText});

  @override
  final String placeId;
  @override
  final String description;
  @override
  final String mainText;
  @override
  final String secondaryText;

  @override
  String toString() {
    return 'PlaceAutocomplete(placeId: $placeId, description: $description, mainText: $mainText, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceAutocomplete &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, description, mainText, secondaryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceAutocompleteCopyWith<_$_PlaceAutocomplete> get copyWith =>
      __$$_PlaceAutocompleteCopyWithImpl<_$_PlaceAutocomplete>(
          this, _$identity);
}

abstract class _PlaceAutocomplete implements PlaceAutocomplete {
  const factory _PlaceAutocomplete(
      {required final String placeId,
      required final String description,
      required final String mainText,
      required final String secondaryText}) = _$_PlaceAutocomplete;

  @override
  String get placeId;
  @override
  String get description;
  @override
  String get mainText;
  @override
  String get secondaryText;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceAutocompleteCopyWith<_$_PlaceAutocomplete> get copyWith =>
      throw _privateConstructorUsedError;
}
