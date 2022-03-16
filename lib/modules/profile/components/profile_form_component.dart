import 'package:deliverzler/modules/profile/components/profile_text_field_component.dart';
import 'package:deliverzler/modules/profile/viewmodels/profile_viewmodel.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileFormComponent extends ConsumerWidget {
  const ProfileFormComponent({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final profileVM = ref.watch(profileViewModel.notifier);

    return Form(
      key: _profileFormKey,
      child: Column(
        children: [
          ProfileTextFieldComponent(
            title: tr(context).fullName,
            hint: tr(context).enterYourName,
            controller: profileVM.profileNameController,
            validator: profileVM.validateName(),
            keyboardType: TextInputType.name,
          ),
          ProfileTextFieldComponent(
            title: tr(context).mobileNumber,
            hint: tr(context).enterYourNumber,
            controller: profileVM.profileMobileController,
            validator: profileVM.validateMobile(),
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
                profileVM.updateProfile();
              }
            },
          ),
        ],
      ),
    );
  }
}
