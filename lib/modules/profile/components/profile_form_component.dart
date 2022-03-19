import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/utils/validators.dart';
import 'package:deliverzler/modules/profile/components/profile_text_field_component.dart';
import 'package:deliverzler/modules/profile/viewmodels/profile_provider.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileFormComponent extends HookConsumerWidget {
  const ProfileFormComponent({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(userRepoProvider).userModel;
    final _nameController =
        useTextEditingController(text: _userModel?.name ?? '');
    final _mobileController =
        useTextEditingController(text: _userModel?.phone ?? '');

    return Form(
      key: _profileFormKey,
      child: Column(
        children: [
          ProfileTextFieldComponent(
            title: tr(context).fullName,
            hint: tr(context).enterYourName,
            controller: _nameController,
            validator: Validators.instance.validateName,
            keyboardType: TextInputType.name,
          ),
          ProfileTextFieldComponent(
            title: tr(context).mobileNumber,
            hint: tr(context).enterYourNumber,
            controller: _mobileController,
            validator: Validators.instance.validateMobileNumber,
            keyboardType: TextInputType.phone,
            isLastTextField: true,
          ),
          SizedBox(
            height: Sizes.vMarginHigh(context),
          ),
          CustomButton(
            text: tr(context).confirm,
            onPressed: () {
              if (_profileFormKey.currentState!.validate()) {
                ref.watch(profileProvider.notifier).updateProfile(
                      name: _nameController.text,
                      mobile: _mobileController.text,
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
