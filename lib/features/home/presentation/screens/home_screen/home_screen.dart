import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:deliverzler/features/home/presentation/screens/home_screen/home_screen_compact.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const HomeScreenCompact(),
      ),
    );
  }
}
