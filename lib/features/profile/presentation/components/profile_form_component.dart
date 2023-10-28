import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../domain/profile_details.dart';
import '../providers/profile_details_provider.dart';
import '../widgets/titled_text_field_item.dart';

class ProfileFormComponent extends HookConsumerWidget {
  const ProfileFormComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.easyListen(profileDetailsStateProvider);

    final user = ref.watch(currentUserProvider);

    final profileFormKey = useMemoized(GlobalKey<FormState>.new);
    final nameController = useTextEditingController(text: user.name ?? '');
    final mobileController = useTextEditingController(text: user.phone ?? '');

    void updateProfile() {
      if (profileFormKey.currentState!.validate()) {
        final params = ProfileDetails(
          name: nameController.text,
          phone: mobileController.text,
        );
        ref.read(profileDetailsStateProvider.notifier).updateProfile(params);
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
            child: Column(
              children: [
                TitledTextFieldItem(
                  controller: nameController,
                  title: tr(context).fullName,
                  hintText: tr(context).enterYourName,
                  validator: ProfileDetails.validateName(context),
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: Sizes.marginV24,
                ),
                TitledTextFieldItem(
                  title: tr(context).mobileNumber,
                  controller: mobileController,
                  hintText: tr(context).enterYourNumber,
                  validator: ProfileDetails.validateMobile(context),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.marginV40,
          ),
          CustomElevatedButton(
            enableGradient: true,
            onPressed: ref.isLoading(profileDetailsStateProvider) ? null : updateProfile,
            child: Text(
              tr(context).confirm,
              style: TextStyles.coloredElevatedButton(context),
            ),
          ),
        ],
      ),
    );
  }
}
