import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:deliverzler/features/settings/presentation/screens/settings_screen/settings_screen_compact.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const SettingsScreenCompact(),
      ),
    );
  }
}
