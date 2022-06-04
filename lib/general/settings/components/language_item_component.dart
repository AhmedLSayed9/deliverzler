import 'package:deliverzler/core/viewmodels/app_locale_provider.dart';
import 'package:deliverzler/general/settings/utils/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class LanguageItemComponent extends ConsumerWidget {
  const LanguageItemComponent({
    required this.language,
    Key? key,
  }) : super(key: key);

  final Language language;

  @override
  Widget build(BuildContext context, ref) {
    return PlatformWidget(
      material: (_, __) {
        return InkWell(
          onTap: () {
            ref.watch(appLocaleProvider.notifier).changeLocale(
                  languageCode: language.code,
                );
          },
          child: _SharedItemComponent(language),
        );
      },
      cupertino: (_, __) {
        return GestureDetector(
          onTap: () {
            ref.watch(appLocaleProvider.notifier).changeLocale(
                  languageCode: language.code,
                );
          },
          child: _SharedItemComponent(language),
        );
      },
    );
  }
}

class _SharedItemComponent extends StatelessWidget {
  const _SharedItemComponent(
    this.language, {
    Key? key,
  }) : super(key: key);

  final Language language;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Sizes.vPaddingSmallest(context),
        horizontal: Sizes.hPaddingMedium(context),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.9),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).focusColor.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(language.flag),
                radius: Sizes.iconsSizes(context)['s6'],
              ),
              Consumer(
                builder: (context, ref, child) {
                  final _selectedLanguage =
                      ref.watch(appLocaleProvider)?.languageCode;
                  return (_selectedLanguage == language.code)
                      ? CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                          radius: Sizes.iconsSizes(context)['s6'],
                          child: Icon(
                            PlatformIcons(context).checkMark,
                            size: Sizes.iconsSizes(context)['s5'],
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
          SizedBox(
            width: Sizes.hMarginSmall(context),
          ),
          Expanded(
            child: CustomText.h4(
              context,
              language.getCurrentLanguageName(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
