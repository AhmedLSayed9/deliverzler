import 'package:flutter/material.dart';

import '../../components/route_error_component.dart';
import '../../styles/sizes.dart';
import '../../utils/scroll_behaviors.dart';
import '../../widgets/platform_widgets/platform_scaffold.dart';

class ErrorScreenCompact extends StatelessWidget {
  const ErrorScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: CustomScrollView(
        scrollBehavior: MainScrollBehavior(),
        slivers: const [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.screenMarginV16,
                horizontal: Sizes.screenMarginH28,
              ),
              child: RouteErrorComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
