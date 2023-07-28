import 'package:flutter/material.dart';

import '../../components/route_error_component.dart';
import '../../styles/sizes.dart';
import '../full_screen_scaffold.dart';

class ErrorScreenCompact extends StatelessWidget {
  const ErrorScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return const FullScreenScaffold(
      body: CustomScrollView(
        slivers: [
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
