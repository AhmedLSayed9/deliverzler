// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_autocomplete_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceAutocompleteDto _$PlaceAutocompleteDtoFromJson(Map<String, dynamic> json) {
  return _PlaceAutocompleteDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceAutocompleteDto {
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readMainText)
  String get mainText => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readSecondaryText)
  String get secondaryText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceAutocompleteDtoCopyWith<PlaceAutocompleteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceAutocompleteDtoCopyWith<$Res> {
  factory $PlaceAutocompleteDtoCopyWith(PlaceAutocompleteDto value,
          $Res Function(PlaceAutocompleteDto) then) =
      _$PlaceAutocompleteDtoCopyWithImpl<$Res, PlaceAutocompleteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'description') String description,
      @JsonKey(readValue: _readMainText) String mainText,
      @JsonKey(readValue: _readSecondaryText) String secondaryText});
}

/// @nodoc
class _$PlaceAutocompleteDtoCopyWithImpl<$Res,
        $Val extends PlaceAutocompleteDto>
    implements $PlaceAutocompleteDtoCopyWith<$Res> {
  _$PlaceAutocompleteDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_PlaceAutocompleteDtoCopyWith<$Res>
    implements $PlaceAutocompleteDtoCopyWith<$Res> {
  factory _$$_PlaceAutocompleteDtoCopyWith(_$_PlaceAutocompleteDto value,
          $Res Function(_$_PlaceAutocompleteDto) then) =
      __$$_PlaceAutocompleteDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'description') String description,
      @JsonKey(readValue: _readMainText) String mainText,
      @JsonKey(readValue: _readSecondaryText) String secondaryText});
}

/// @nodoc
class __$$_PlaceAutocompleteDtoCopyWithImpl<$Res>
    extends _$PlaceAutocompleteDtoCopyWithImpl<$Res, _$_PlaceAutocompleteDto>
    implements _$$_PlaceAutocompleteDtoCopyWith<$Res> {
  __$$_PlaceAutocompleteDtoCopyWithImpl(_$_PlaceAutocompleteDto _value,
      $Res Function(_$_PlaceAutocompleteDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? mainText = null,
    Object? secondaryText = null,
  }) {
    return _then(_$_PlaceAutocompleteDto(
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
@JsonSerializable(createToJson: false)
class _$_PlaceAutocompleteDto extends _PlaceAutocompleteDto {
  const _$_PlaceAutocompleteDto(
      {@JsonKey(name: 'place_id') required this.placeId,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(readValue: _readMainText) required this.mainText,
      @JsonKey(readValue: _readSecondaryText) required this.secondaryText})
      : super._();

  factory _$_PlaceAutocompleteDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceAutocompleteDtoFromJson(json);

  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(readValue: _readMainText)
  final String mainText;
  @override
  @JsonKey(readValue: _readSecondaryText)
  final String secondaryText;

  @override
  String toString() {
    return 'PlaceAutocompleteDto(placeId: $placeId, description: $description, mainText: $mainText, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceAutocompleteDto &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, placeId, description, mainText, secondaryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceAutocompleteDtoCopyWith<_$_PlaceAutocompleteDto> get copyWith =>
      __$$_PlaceAutocompleteDtoCopyWithImpl<_$_PlaceAutocompleteDto>(
          this, _$identity);
}

abstract class _PlaceAutocompleteDto extends PlaceAutocompleteDto {
  const factory _PlaceAutocompleteDto(
      {@JsonKey(name: 'place_id')
          required final String placeId,
      @JsonKey(name: 'description')
          required final String description,
      @JsonKey(readValue: _readMainText)
          required final String mainText,
      @JsonKey(readValue: _readSecondaryText)
          required final String secondaryText}) = _$_PlaceAutocompleteDto;
  const _PlaceAutocompleteDto._() : super._();

  factory _PlaceAutocompleteDto.fromJson(Map<String, dynamic> json) =
      _$_PlaceAutocompleteDto.fromJson;

  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(readValue: _readMainText)
  String get mainText;
  @override
  @JsonKey(readValue: _readSecondaryText)
  String get secondaryText;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceAutocompleteDtoCopyWith<_$_PlaceAutocompleteDto> get copyWith =>
      throw _privateConstructorUsedError;
}
