import 'package:deliverzler/core/presentation/screens/full_screen_platfom_scaffold.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:lottie/lottie.dart';

class SplashScreenCompact extends StatelessWidget {
  const SplashScreenCompact({
    required this.fadeInController,
    Key? key,
  }) : super(key: key);

  final FadeInController fadeInController;

  @override
  Widget build(BuildContext context) {
    return FullScreenPlatformScaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.splash,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ScrollConfiguration(
            behavior: MainScrollBehavior(),
            child: SingleChildScrollView(
              child: FadeIn(
                curve: Curves.easeIn,
                controller: fadeInController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.screenMarginV16,
                    horizontal: Sizes.screenMarginH28,
                  ),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: Sizes.maxWidth600,
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.64,
                          child: Lottie.asset(
                            AppImages.splashAnimation,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.marginV12,
                      ),
                      CustomText.f28(
                        context,
                        tr(context).appName,
                        weight: FontStyles.fontWeightExtraBold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
