import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_features/theme/presentation/utils/themes/cupertino_custom_theme.dart';
import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../core/presentation/utils/validators.dart';
import '../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../core/presentation/widgets/platform_widgets/platform_icons.dart';
import '../../../core/presentation/widgets/platform_widgets/platform_widget.dart';

class LoginTextFieldsSection extends ConsumerWidget {
  const LoginTextFieldsSection({
    required this.emailController,
    required this.passwordController,
    required this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(String)? onFieldSubmitted;

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

  List<Widget> _sharedItemComponent(
    BuildContext context,
    WidgetRef ref, {
    required bool isMaterial,
  }) {
    return [
      CustomTextFormField(
        key: const ValueKey('login_email'),
        hintText: tr(context).email,
        controller: emailController,
        validator: ref.watch(validatorsProvider).validateEmail(context),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        suffix: Icon(PlatformIcons.mail),
      ),
      if (isMaterial)
        const SizedBox(
          height: Sizes.textFieldMarginV24,
        ),
      CustomTextFormField(
        key: const ValueKey('login_password'),
        hintText: tr(context).password,
        controller: passwordController,
        validator: ref.watch(validatorsProvider).validateLoginPassword(context),
        textInputAction: TextInputAction.go,
        obscureText: true,
        suffix: Icon(PlatformIcons.password),
        onFieldSubmitted: onFieldSubmitted,
      ),
    ];
  }
}
