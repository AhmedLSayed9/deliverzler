import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'language_screen_compact.dart';

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
