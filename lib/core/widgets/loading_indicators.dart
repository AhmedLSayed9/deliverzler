import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class LoadingIndicators {
  LoadingIndicators._();

  static final instance = LoadingIndicators._();

  Widget smallLoadingAnimation(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    return Center(
      child: Container(
        color: Colors.transparent,
        child: Lottie.asset(
          AppImages.loadingAnimation,
          height: height ?? Sizes.loadingAnimationDefaultHeight(context),
          width: width ?? Sizes.loadingAnimationDefaultWidth(context),
        ),
      ),
    );
  }
}
