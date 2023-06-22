import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/themes/cupertino_custom_theme.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_widget.dart';
import '../../domain/value_objects.dart';
import '../widgets/titled_text_field_item.dart';

class ProfileTextFieldsSection extends StatelessWidget {
  const ProfileTextFieldsSection({
    required this.nameController,
    required this.mobileController,
    super.key,
  });

  final TextEditingController nameController;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_) {
        return Column(
          children: _sharedItemComponent(context, true),
        );
      },
      cupertino: (_) {
        return CupertinoFormSection.insetGrouped(
          decoration: CupertinoCustomTheme.cupertinoFormSectionDecoration(context),
          backgroundColor: Colors.transparent,
          margin: EdgeInsets.zero,
          children: _sharedItemComponent(context, false),
        );
      },
    );
  }

  List<Widget> _sharedItemComponent(BuildContext context, bool isMaterial) {
    return [
      TitledTextFieldItem(
        title: tr(context).fullName,
        hint: tr(context).enterYourName,
        controller: nameController,
        validator: ProfileDetails.validateName(context),
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
        validator: ProfileDetails.validateMobile(context),
        keyboardType: TextInputType.phone,
        isLastTextField: true,
      ),
    ];
  }
}
