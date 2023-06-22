import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/core_features/theme/presentation/utils/themes/cupertino_custom_theme.dart';
import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/custom_text_form_field.dart';
import '../../../core/presentation/widgets/platform_widgets/platform_icons.dart';
import '../../../core/presentation/widgets/platform_widgets/platform_widget.dart';
import '../../domain/sign_in_with_email.dart';

class LoginTextFieldsSection extends StatelessWidget {
  const LoginTextFieldsSection({
    required this.emailController,
    required this.passwordController,
    required this.onFieldSubmitted,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final ValueChanged<String>? onFieldSubmitted;

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
      CustomTextFormField(
        key: const ValueKey('login_email'),
        hintText: tr(context).email,
        controller: emailController,
        validator: SignInWithEmail.validateEmail(context),
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
        validator: SignInWithEmail.validatePassword(context),
        textInputAction: TextInputAction.go,
        obscureText: true,
        suffix: Icon(PlatformIcons.password),
        onFieldSubmitted: onFieldSubmitted,
      ),
    ];
  }
}
