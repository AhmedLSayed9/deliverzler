import 'package:flutter/material.dart';

import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/scroll_behaviors.dart';
import '../../components/profile_form_component.dart';
import '../../components/profile_header_component.dart';

class ProfileScreenMedium extends StatelessWidget {
  const ProfileScreenMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScreenScaffold(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: const CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.screenMarginV20,
                  horizontal: Sizes.screenMarginH36,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ProfileHeaderComponent(),
                    ),
                    SizedBox(
                      width: Sizes.marginH16,
                    ),
                    Flexible(
                      flex: 1,
                      child: ProfileFormComponent(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
