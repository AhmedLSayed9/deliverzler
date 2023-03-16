import 'package:flutter/material.dart';

import 'package:fpdart/fpdart.dart';

import '../../../../../auth/presentation/providers/sign_out_provider.dart';
import '../../../../../core/domain/entities/event.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/font_styles.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_widget.dart';

class LogoutComponent extends HookConsumerWidget {
  const LogoutComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    void signOut() {
      final bool canSubmit = !ref.read(signOutStateProvider).isLoading;

      if (canSubmit) {
        ref
            .read(signOutEventProvider.notifier)
            .update((_) => Some(Event.unique(null)));
      }
    }

    return PlatformWidget(
      material: (_) {
        return InkWell(
          onTap: signOut,
          child: const _SharedItemComponent(),
        );
      },
      cupertino: (_) {
        return GestureDetector(
          onTap: signOut,
          child: const _SharedItemComponent(),
        );
      },
    );
  }
}

class _SharedItemComponent extends StatelessWidget {
  const _SharedItemComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.paddingV14,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(Sizes.dialogR6),
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: Sizes.marginH16,
          ),
          CustomText.f18(
            context,
            tr(context).logOut,
            weight: FontStyles.fontWeightExtraBold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
