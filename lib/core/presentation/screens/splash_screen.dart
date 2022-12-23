import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/screens/full_screen_platfom_scaffold.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deliverzler/core/presentation/hooks/fade_in_controller_hook.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/providers/splash_provider.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final fadeController = useFadeInController();
    ref.listen<AsyncValue<String>>(
      splashProvider,
      (prevState, newState) {
        newState.unwrapPrevious().whenOrNull(
          data: (nextPage) {
            NavigationService.pushReplacementAll(
              context,
              isNamed: true,
              page: nextPage,
              arguments: {'offAll': true},
            );
          },
        );
      },
    );

    return FullScreenPlatformScaffold(
      body: FadeIn(
        curve: Curves.easeIn,
        controller: fadeController,
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
                  width: Sizes.imageRadius220(context),
                ),
                SizedBox(
                  height: Sizes.marginV10(context),
                ),
                CustomText.f32(
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
