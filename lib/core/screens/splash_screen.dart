import 'package:deliverzler/core/hooks/fade_in_controller_hook.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/viewmodels/splash_provider.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _logoFadeController = useFadeInController(context);
    final _titleFadeController = useFadeInController(context);
    ref.watch(splashProvider);

    return PopUpPage(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: Sizes.screenHeight(context),
            width: Sizes.screenWidth(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.splash,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeIn(
                  curve: Curves.easeIn,
                  controller: _logoFadeController,
                  child: Lottie.asset(
                    AppImages.splashAnimation,
                    width: Sizes.splashLogoSize(context),
                  ),
                ),
                SizedBox(
                  height: Sizes.vMarginSmallest(context),
                ),
                SizedBox(
                  width: Sizes.screenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        curve: Curves.easeIn,
                        controller: _titleFadeController,
                        duration: const Duration(seconds: 1),
                        child: CustomText.h1(
                          context,
                          tr(context).appName,
                          weight: FontStyles.fontWeightExtraBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
