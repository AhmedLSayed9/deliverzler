import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/presentation/screens/nested_screen_wrapper.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/features/settings/presentation/components/language_components/language_item_component.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScreenWrapper(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.screenPaddingV20(context),
              horizontal: Sizes.screenPaddingH40(context),
            ),
            child: Column(
              children: <Widget>[
                CustomText.f20(
                  context,
                  tr(context).selectYourPreferredLanguage,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: Sizes.marginV22(context),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppLocale.values.length,
                  itemBuilder: (context, index) {
                    return LanguageItemComponent(
                      appLocale: AppLocale.values[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: Sizes.marginV16(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
