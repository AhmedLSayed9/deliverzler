import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/features/profile/presentation/components/profile_text_fields_section.dart';
import 'package:deliverzler/features/profile/presentation/providers/update_profile_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    final updateProfile = useCallback(() {
      final bool canSubmit =
          !ref.read(updateProfileDataStateProvider).isLoading;

      if (canSubmit && profileFormKey.currentState!.validate()) {
        final params = user.copyWith(
          name: nameController.text,
          phone: mobileController.text,
        );
        ref.read(updateProfileDataParamsProvider.notifier).state = Some(params);
      }
    }, []);

    return Form(
      key: profileFormKey,
      child: Column(
        children: [
          ProfileTextFieldsSection(
            nameController: nameController,
            mobileController: mobileController,
          ),
          SizedBox(
            height: Sizes.marginV40(context),
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
