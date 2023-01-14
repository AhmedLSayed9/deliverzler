import 'package:deliverzler/core/presentation/components/data_error_component.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

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
