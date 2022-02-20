import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/general/components/settings_components/language_item_component.dart';
import 'package:deliverzler/general/model/language_model.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.languageScreenIcon,
          title: tr(context).language,
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingDefault,
            horizontal: Sizes.screenHPaddingDefault,
          ),
          child: Column(
            children: <Widget>[
              CustomText.h3(
                context,
                tr(context).selectYourPreferredLanguage,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: Sizes.vMarginMedium,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: languagesList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: Sizes.vMarginSmall,
                  );
                },
                itemBuilder: (context, index) {
                  return LanguageItemComponent(
                    languageModel: languagesList[index],
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
