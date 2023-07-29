import 'package:flutter/material.dart';

import '../../../../../core/core_features/locale/presentation/utils/app_locale.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../components/language_components/language_item_component.dart';

class LanguageScreenCompact extends StatelessWidget {
  const LanguageScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScreenScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.screenPaddingV20,
            horizontal: Sizes.screenPaddingH36,
          ),
          child: Column(
            children: <Widget>[
              Text(
                tr(context).selectYourPreferredLanguage,
                style: TextStyles.f18(context),
              ),
              const SizedBox(
                height: Sizes.marginV20,
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
                  return const SizedBox(
                    height: Sizes.marginV16,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
