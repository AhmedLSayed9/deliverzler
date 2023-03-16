import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../auth/domain/entities/user.dart';
import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/domain/entities/event.dart';
import '../../../../core/presentation/extensions/app_error_extension.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/dialogs.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../providers/update_profile_data_provider.dart';
import 'profile_text_fields_section.dart';

class ProfileFormComponent extends HookConsumerWidget {
  const ProfileFormComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(currentUserProvider);

    ref.listen<AsyncValue<Option<User>>>(
      updateProfileDataStateProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
              loading: () => NavigationService.dismissDialog(context),
            );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
            );
      },
    );

    final profileFormKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController(text: user.name ?? '');
    final mobileController = useTextEditingController(text: user.phone ?? '');

    void updateProfile() {
      final bool canSubmit =
          !ref.read(updateProfileDataStateProvider).isLoading;

      if (canSubmit && profileFormKey.currentState!.validate()) {
        final params = user.copyWith(
          name: nameController.text,
          phone: mobileController.text,
        );
        ref
            .read(updateProfileDataEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }

    return Form(
      key: profileFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Sizes.maxWidth360,
            ),
            child: ProfileTextFieldsSection(
              nameController: nameController,
              mobileController: mobileController,
            ),
          ),
          const SizedBox(
            height: Sizes.marginV36,
          ),
          CustomButton(
            text: tr(context).confirm,
            onPressed: updateProfile,
          ),
        ],
      ),
    );
  }
}
