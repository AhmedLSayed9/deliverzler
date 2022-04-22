import 'package:deliverzler/core/hooks/fade_in_controller_hook.dart';
import 'package:deliverzler/core/services/localization_service.dart';
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
    final _fadeController = useFadeInController();
    ref.watch(splashProvider);

    return PopUpPage(
      body: FadeIn(
        curve: Curves.easeIn,
        controller: _fadeController,
        child: Stack(
          children: [
            Image.asset(
              AppImages.splash,
              height: Sizes.fullScreenHeight(context),
              width: Sizes.fullScreenWidth(context),
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  AppImages.splashAnimation,
                  width: Sizes.splashLogoSize(context),
                ),
                SizedBox(
                  height: Sizes.vMarginSmallest(context),
                ),
                CustomText.h1(
                  context,
                  tr(context).appName,
                  weight: FontStyles.fontWeightExtraBold,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
