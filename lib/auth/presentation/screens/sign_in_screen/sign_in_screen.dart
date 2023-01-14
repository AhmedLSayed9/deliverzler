import 'package:deliverzler/auth/presentation/providers/sign_in_provider.dart';
import 'package:deliverzler/auth/presentation/screens/sign_in_screen/sign_in_screen_compact.dart';
import 'package:deliverzler/auth/presentation/screens/sign_in_screen/sign_in_screen_medium.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:flutter/material.dart';
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

    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const SignInScreenCompact(),
      ),
      medium: (_) => OrientationLayout(
        portrait: (_) => const SignInScreenMedium(),
      ),
    );
  }
}
