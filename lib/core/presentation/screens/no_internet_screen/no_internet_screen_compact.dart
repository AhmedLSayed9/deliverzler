import 'package:flutter/material.dart';

import '../../components/no_internet_error_component.dart';
import '../../styles/styles.dart';
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
                vertical: Sizes.screenPaddingV16,
                horizontal: Sizes.screenPaddingH28,
              ),
              child: NoInternetErrorComponent(),
            ),
          ),
        ],
      ),
    );
  }
}
