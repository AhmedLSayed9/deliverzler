import 'package:flutter/material.dart';

import '../../components/no_internet_error_component.dart';
import '../../styles/sizes.dart';
import '../full_screen_scaffold.dart';

class NoInternetScreenCompact extends StatelessWidget {
  const NoInternetScreenCompact({super.key});

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
              child: NoInternetErrorComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
