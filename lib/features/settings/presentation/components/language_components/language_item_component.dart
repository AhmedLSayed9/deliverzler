import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_icons.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class LanguageItemComponent extends ConsumerWidget {
  const LanguageItemComponent({
    required this.appLocale,
    Key? key,
  }) : super(key: key);

  final AppLocale appLocale;

  @override
  Widget build(BuildContext context, ref) {
    return PlatformWidget(
      material: (_) {
        return InkWell(
          onTap: () {
            ref
                .read(appLocaleControllerProvider.notifier)
                .changeLocale(appLocale);
          },
          child: _SharedItemComponent(appLocale),
        );
      },
      cupertino: (_) {
        return GestureDetector(
          onTap: () {
            ref
                .read(appLocaleControllerProvider.notifier)
                .changeLocale(appLocale);
          },
          child: _SharedItemComponent(appLocale),
        );
      },
    );
  }
}

class _SharedItemComponent extends StatelessWidget {
  const _SharedItemComponent(
    this.appLocale, {
    Key? key,
  }) : super(key: key);

  final AppLocale appLocale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.paddingV12,
        horizontal: Sizes.paddingH20,
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
                backgroundImage: AssetImage(appLocale.flag),
                radius: Sizes.icon16,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final currentLocale = ref.watch(currentAppLocaleProvider);
                  return (currentLocale.code == appLocale.code)
                      ? CircleAvatar(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.8),
                          radius: Sizes.icon16,
                          child: Icon(
                            PlatformIcons.checkMark,
                            size: Sizes.icon24,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
          const SizedBox(
            width: Sizes.marginH16,
          ),
          Expanded(
            child: CustomText.f16(
              context,
              appLocale.getLanguageName(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
