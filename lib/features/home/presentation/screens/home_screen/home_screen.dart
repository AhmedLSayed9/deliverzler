import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'home_screen_compact.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const HomeScreenCompact(),
      ),
    );
  }
}
