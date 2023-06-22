import 'package:flutter/material.dart';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import '../../providers/sign_in_provider.dart';
import 'sign_in_screen_compact.dart';
import 'sign_in_screen_medium.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.easyListen(signInStateProvider);

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
