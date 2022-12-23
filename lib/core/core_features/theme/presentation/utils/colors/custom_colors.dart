import 'package:flutter/material.dart';

CustomColors customColors(BuildContext context) =>
    Theme.of(context).extension<CustomColors>()!;

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.font40Color,
    required this.font32Color,
    required this.font24Color,
    required this.font20Color,
    required this.font17Color,
    required this.font14Color,
    required this.font12Color,
    required this.whiteColor,
    required this.blackColor,
    required this.redColor,
    required this.greenColor,
    required this.greyColor,
    required this.marinerColor,
    required this.loadingIndicatorColor,
  });

  final Color? font40Color;
  final Color? font32Color;
  final Color? font24Color;
  final Color? font20Color;
  final Color? font17Color;
  final Color? font14Color;
  final Color? font12Color;
  final Color? whiteColor;
  final Color? blackColor;
  final Color? redColor;
  final Color? greenColor;
  final Color? greyColor;
  final Color? marinerColor;
  final Color? loadingIndicatorColor;

  @override
  CustomColors copyWith({
    Color? font40Color,
    Color? font32Color,
    Color? font24Color,
    Color? font20Color,
    Color? font17Color,
    Color? font14Color,
    Color? font12Color,
    Color? whiteColor,
    Color? blackColor,
    Color? redColor,
    Color? greenColor,
    greyColor,
    Color? orangeColor,
    Color? marinerColor,
    Color? loadingIndicatorColor,
  }) {
    return CustomColors(
      font40Color: font40Color ?? this.font40Color,
      font32Color: font32Color ?? this.font32Color,
      font24Color: font24Color ?? this.font24Color,
      font20Color: font20Color ?? this.font20Color,
      font17Color: font17Color ?? this.font17Color,
      font14Color: font14Color ?? this.font14Color,
      font12Color: font12Color ?? this.font12Color,
      whiteColor: whiteColor ?? this.whiteColor,
      blackColor: blackColor ?? this.blackColor,
      redColor: redColor ?? this.redColor,
      greenColor: greenColor ?? this.greenColor,
      greyColor: greyColor ?? this.greyColor,
      marinerColor: marinerColor ?? this.marinerColor,
      loadingIndicatorColor:
          loadingIndicatorColor ?? this.loadingIndicatorColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      font40Color: Color.lerp(font40Color, other.font40Color, t),
      font32Color: Color.lerp(font32Color, other.font32Color, t),
      font24Color: Color.lerp(font24Color, other.font24Color, t),
      font20Color: Color.lerp(font20Color, other.font20Color, t),
      font17Color: Color.lerp(font17Color, other.font17Color, t),
      font14Color: Color.lerp(font14Color, other.font14Color, t),
      font12Color: Color.lerp(font12Color, other.font12Color, t),
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t),
      blackColor: Color.lerp(blackColor, other.blackColor, t),
      redColor: Color.lerp(redColor, other.redColor, t),
      greenColor: Color.lerp(greenColor, other.greenColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      marinerColor: Color.lerp(marinerColor, other.marinerColor, t),
      loadingIndicatorColor:
          Color.lerp(loadingIndicatorColor, other.loadingIndicatorColor, t),
    );
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'font40Color: $font40Color, font32Color: $font32Color, font24Color: $font24Color'
      'font20Color: $font20Color, font17Color: $font17Color, font14Color: $font14Color'
      'font12Color: $font12Color'
      'whiteColor: $whiteColor, blackColor: $blackColor, redColor: $redColor'
      'greenColor: $greenColor, greyColor: $greyColor, marinerColor: $marinerColor'
      'loadingIndicatorColor: $loadingIndicatorColor'
      ')';
}
