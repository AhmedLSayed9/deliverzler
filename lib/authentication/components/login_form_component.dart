import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/authentication/viewmodels/auth_loading_provider.dart';
import 'package:deliverzler/authentication/viewmodels/auth_viewmodel.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';

class LoginFormComponent extends ConsumerWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final authVM = ref.watch(authViewModel.notifier);
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: authVM.emailController,
            validator: authVM.validateLoginEmail(),
            validationColor: AppColors.primaryColor,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            margin: EdgeInsets.only(
              bottom: Sizes.textFieldVMarginMedium,
            ),
            suffixIcon: const Icon(
              Icons.email,
              color: Color(0xff9b9b9b),
            ),
            fillColor: Colors.transparent,
            hintText: tr('email'),
            key: const ValueKey('email'),
          ),
          CustomTextField(
            controller: authVM.passwordController,
            validator: authVM.validateLoginPassword(),
            onFieldSubmitted: (value) {
              if (_loginFormKey.currentState!.validate()) {
                authVM.signInWithEmailAndPassword(context);
              }
            },
            validationColor: AppColors.primaryColor,
            textInputAction: TextInputAction.go,
            obscureText: true,
            margin: EdgeInsets.only(
              bottom: Sizes.textFieldVMarginMedium,
            ),
            fillColor: Colors.transparent,
            suffixIcon: const Icon(
              Icons.password,
              color: Color(0xff9b9b9b),
            ),
            hintText: tr('password'),
            key: const ValueKey('password'),
          ),
          SizedBox(
            height: Sizes.vMarginSmall,
          ),
          ref.watch(authLoadingProvider)
              ? LoadingIndicators.instance.smallLoadingAnimation(
                  context,
                  width: Sizes.loadingAnimationButton,
                  height: Sizes.loadingAnimationButton,
                )
              : CustomButton(
                  text: tr('signIn'),
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      authVM.signInWithEmailAndPassword(context);
                    }
                  },
                ),
        ],
      ),
    );
  }
}
