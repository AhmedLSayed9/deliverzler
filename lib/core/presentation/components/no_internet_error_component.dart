import 'package:flutter/material.dart';

import '../../infrastructure/network/network_info.dart';
import '../helpers/localization_helper.dart';
import '../routing/app_router.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading_widgets.dart';

class NoInternetErrorComponent extends StatelessWidget {
  const NoInternetErrorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const DeliveryLoadingAnimation(),
        const SizedBox(
          height: Sizes.marginV32,
        ),
        CustomText.f20(
          context,
          tr(context).noInternetConnection,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV12,
        ),
        CustomText.f14(
          context,
          tr(context).pleaseCheckYourDeviceNetwork,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV32,
        ),
        HookConsumer(
          builder: (context, ref, child) {
            final networkInfo = ref.watch(networkInfoProvider);
            final isLoading = useState<bool>(false);

            Future<void> retryOnPressed() async {
              if (isLoading.value) return;

              isLoading.value = true;
              await networkInfo.hasInternetConnection.then(
                (value) {
                  if (value) {
                    const SplashRoute().go(context);
                  }
                },
              );
              isLoading.value = false;
            }

            return CustomElevatedButton(
              onPressed: retryOnPressed,
              buttonColor: Theme.of(context).colorScheme.primary,
              child: CustomText.f16(
                context,
                tr(context).signIn,
                color: const Color(0xffffffff),
                weight: FontStyles.fontWeightSemiBold,
              ),
            );
          },
        ),
      ],
    );
  }
}
