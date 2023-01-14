import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:deliverzler/features/map/presentation/screens/map_screen/map_screen_compact.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const MapScreenCompact(),
      ),
    );
  }
}
