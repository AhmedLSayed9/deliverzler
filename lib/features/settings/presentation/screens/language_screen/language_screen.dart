import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:deliverzler/features/settings/presentation/screens/language_screen/language_screen_compact.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const LanguageScreenCompact(),
      ),
    );
  }
}
