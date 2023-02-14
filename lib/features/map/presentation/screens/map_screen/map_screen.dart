import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'map_screen_compact.dart';

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
