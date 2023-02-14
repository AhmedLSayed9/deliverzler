import 'package:flutter/material.dart';

import '../../components/data_error_component.dart';
import '../../helpers/localization_helper.dart';
import '../../styles/sizes.dart';
import '../../utils/scroll_behaviors.dart';
import '../../widgets/platform_widgets/platform_scaffold.dart';

class NoInternetScreenCompact extends StatelessWidget {
  const NoInternetScreenCompact({
    required this.retryOnPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback retryOnPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.screenMarginV16,
                  horizontal: Sizes.screenMarginH28,
                ),
                child: DataErrorComponent(
                  title: tr(context).noInternetConnection,
                  description: tr(context).pleaseCheckYourDeviceNetwork,
                  onPressed: retryOnPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
