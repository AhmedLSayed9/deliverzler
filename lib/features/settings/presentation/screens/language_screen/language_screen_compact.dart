import 'package:flutter/material.dart';

import '../../../../../core/core_features/locale/presentation/utils/app_locale.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';
import '../../components/language_components/language_item_component.dart';

class LanguageScreenCompact extends StatelessWidget {
  const LanguageScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScreenScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.screenMarginV20,
            horizontal: Sizes.screenMarginH36,
          ),
          child: Column(
            children: <Widget>[
              CustomText.f18(
                context,
                tr(context).selectYourPreferredLanguage,
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
