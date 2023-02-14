import 'package:flutter/material.dart';

import '../../../../../core/presentation/screens/nested_screen_wrapper.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/scroll_behaviors.dart';
import '../../components/profile_form_component.dart';
import '../../components/profile_header_component.dart';

class ProfileScreenCompact extends StatelessWidget {
  const ProfileScreenCompact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScreenWrapper(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.screenMarginV20,
              horizontal: Sizes.screenMarginH36,
            ),
            child: Column(
              children: const [
                ProfileHeaderComponent(),
                SizedBox(
                  height: Sizes.marginV28,
                ),
                ProfileFormComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
