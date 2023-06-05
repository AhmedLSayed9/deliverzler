import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'profile_screen_compact.dart';
import 'profile_screen_medium.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const ProfileScreenCompact(),
      ),
      medium: (_) => OrientationLayout(
        portrait: (_) => const ProfileScreenMedium(),
      ),
    );
  }
}
