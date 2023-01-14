import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:deliverzler/features/profile/presentation/screens/profile_screen/profile_screen_compact.dart';
import 'package:deliverzler/features/profile/presentation/screens/profile_screen/profile_screen_medium.dart';
import 'package:flutter/material.dart';

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
