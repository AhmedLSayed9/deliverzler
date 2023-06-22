// ignore_for_file: inference_failure_on_untyped_parameter, argument_type_not_assignable
// TODO(Ahmed): Fix this ignore.

import 'package:flutter/material.dart';

import '../styles/sizes.dart';

class CustomIcon extends Container {
  CustomIcon._(
    String path, {
    super.key,
    bundle,
    frameBuilder,
    errorBuilder,
    semanticLabel,
    excludeFromSemantics = false,
    scale,
    width,
    height,
    color,
    colorBlendMode,
    fit,
    alignment = Alignment.center,
    repeat = ImageRepeat.noRepeat,
    centerSlice,
    matchTextDirection = false,
    gaplessPlayback = false,
    isAntiAlias = false,
    package,
    filterQuality = FilterQuality.low,
    cacheWidth,
    cacheHeight,
    super.margin,
    super.padding,
  }) : super(
          child: Image.asset(
            path,
            bundle: bundle,
            cacheHeight: cacheHeight,
            cacheWidth: cacheWidth,
            package: package,
            scale: scale,
            frameBuilder: frameBuilder,
            errorBuilder: errorBuilder,
            semanticLabel: semanticLabel,
            excludeFromSemantics: excludeFromSemantics,
            width: width,
            height: height,
            color: color,
            colorBlendMode: colorBlendMode,
            fit: fit,
            alignment: alignment,
            repeat: repeat,
            centerSlice: centerSlice,
            matchTextDirection: matchTextDirection,
            gaplessPlayback: gaplessPlayback,
            isAntiAlias: isAntiAlias,
            filterQuality: filterQuality,
          ),
        );

  CustomIcon.i72(
    String path, {
    Key? key,
    Color? color,
    BoxFit? fit,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) : this._(
          path,
          key: key,
          height: Sizes.icon72,
          width: Sizes.icon72,
          color: color,
          fit: fit,
          padding: padding,
          margin: margin,
        );

  CustomIcon.i48(
    String path, {
    Key? key,
    Color? color,
    BoxFit? fit,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) : this._(
          path,
          key: key,
          height: Sizes.icon44,
          width: Sizes.icon44,
          color: color,
          fit: fit,
          padding: padding,
          margin: margin,
        );

  CustomIcon.i32(
    String path, {
    Key? key,
    Color? color,
    BoxFit? fit,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) : this._(
          path,
          key: key,
          height: Sizes.icon32,
          width: Sizes.icon32,
          color: color,
          fit: fit,
          padding: padding,
          margin: margin,
        );
}
