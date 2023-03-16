import 'package:flutter/material.dart';

import '../../../../core/presentation/extensions/app_error_extension.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/utils/dialogs.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import '../../providers/sign_in_provider.dart';
import 'sign_in_screen_compact.dart';
import 'sign_in_screen_medium.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(
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
