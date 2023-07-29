import 'package:flutter/material.dart';

import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../components/profile_form_component.dart';
import '../../components/profile_header_component.dart';

class ProfileScreenMedium extends StatelessWidget {
  const ProfileScreenMedium({super.key});

  @override
  Widget build(BuildContext context) {
    return const NestedScreenScaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.screenPaddingV20,
                horizontal: Sizes.screenPaddingH36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ProfileHeaderComponent(),
                  ),
                  SizedBox(
                    width: Sizes.marginH16,
                  ),
                  Flexible(
                    child: ProfileFormComponent(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
