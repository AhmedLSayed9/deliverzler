import 'package:flutter/material.dart';

import '../../../../../auth/presentation/providers/sign_out_provider.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_widget.dart';

class LogoutComponent extends HookConsumerWidget {
  const LogoutComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void signOut() {
      ref.read(signOutStateProvider.notifier).signOut();
    }

    return PlatformWidget(
      material: (_) {
        return InkWell(
          onTap: ref.isLoading(signOutStateProvider) ? null : signOut,
          child: const _SharedItemComponent(),
        );
      },
      cupertino: (_) {
        return GestureDetector(
          onTap: ref.isLoading(signOutStateProvider) ? null : signOut,
          child: const _SharedItemComponent(),
        );
      },
    );
  }
}

class _SharedItemComponent extends StatelessWidget {
  const _SharedItemComponent();

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
          Text(
            tr(context).logOut,
            style: TextStyles.f18(context).copyWith(
              fontWeight: FontStyles.fontWeightExtraBold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
