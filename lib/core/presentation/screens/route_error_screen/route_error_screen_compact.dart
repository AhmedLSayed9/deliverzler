import 'package:flutter/material.dart';

import '../../components/route_error_component.dart';
import '../../styles/styles.dart';
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
                vertical: Sizes.screenPaddingV16,
                horizontal: Sizes.screenPaddingH28,
              ),
              child: RouteErrorComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
