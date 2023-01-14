/*
import 'package:deliverzler/auth/presentation/components/login_logo_component.dart';
import 'package:deliverzler/auth/presentation/components/login_form_component.dart';
import 'package:deliverzler/auth/presentation/components/welcome_component.dart';
import 'package:deliverzler/auth/presentation/providers/sign_in_provider.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/screens/full_screen_platfom_scaffold.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AsyncValue<void>>(
      signInStateProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
              loading: () => NavigationService.dismissDialog(context),
            );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
            );
      },
    );

    return FullScreenPlatformScaffold(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(minHeight: Sizes.fullScreenHeight(context)),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.loginBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: Sizes.screenPaddingV80(context),
              horizontal: Sizes.screenPaddingH40(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppLogoComponent(),
                SizedBox(
                  height: Sizes.marginV30(context),
                ),
                const WelcomeComponent(),
                SizedBox(
                  height: Sizes.marginV30(context),
                ),
                const LoginFormComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
