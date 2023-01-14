import 'package:deliverzler/core/core_features/theme/presentation/utils/themes/cupertino_custom_theme.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/utils/validators.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_widget.dart';
import 'package:deliverzler/features/profile/presentation/widgets/titled_text_field_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileTextFieldsSection extends ConsumerWidget {
  const ProfileTextFieldsSection({
    required this.nameController,
    required this.mobileController,
    Key? key,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context, ref) {
    return PlatformWidget(
      material: (_) {
        return Column(
          children: _sharedItemComponent(context, ref, isMaterial: true),
        );
      },
      cupertino: (_) {
        return CupertinoFormSection.insetGrouped(
          decoration:
              CupertinoCustomTheme.cupertinoFormSectionDecoration(context),
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.zero,
          children: _sharedItemComponent(context, ref, isMaterial: false),
        );
      },
    );
  }

  _sharedItemComponent(
    BuildContext context,
    WidgetRef ref, {
    required bool isMaterial,
  }) {
    return [
      TitledTextFieldItem(
        title: tr(context).fullName,
        hint: tr(context).enterYourName,
        controller: nameController,
        validator: ref.watch(validatorsProvider).validateName(context),
        keyboardType: TextInputType.name,
      ),
      if (isMaterial)
        const SizedBox(
          height: Sizes.textFieldMarginV24,
        ),
      TitledTextFieldItem(
        title: tr(context).mobileNumber,
        hint: tr(context).enterYourNumber,
        controller: mobileController,
        validator: ref.watch(validatorsProvider).validateMobileNumber(context),
        keyboardType: TextInputType.phone,
        isLastTextField: true,
      ),
    ];
  }
}
