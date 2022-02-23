import 'package:deliverzler/authentication/viewmodels/auth_provider.dart';
import 'package:deliverzler/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginFormComponent extends HookConsumerWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final _emailController = useTextEditingController(text: '');
    final _passwordController = useTextEditingController(text: '');

    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            validator: Validators.instance.validateEmail,
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
            hintText: tr(context).email,
            key: const ValueKey('email'),
          ),
          CustomTextField(
            controller: _passwordController,
            validator: Validators.instance.validateLoginPassword,
            onFieldSubmitted: (value) {
              if (_loginFormKey.currentState!.validate()) {
                ref.read(authProvider.notifier).signInWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
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
            hintText: tr(context).password,
            key: const ValueKey('password'),
          ),
          SizedBox(
            height: Sizes.vMarginSmall,
          ),
          Consumer(
            builder: (context, ref, child) {
              final _authLoading = ref.watch(
                authProvider.select((state) =>
                    state.maybeWhen(loading: () => true, orElse: () => false)),
              );
              return _authLoading
                  ? LoadingIndicators.instance.smallLoadingAnimation(
                      context,
                      width: Sizes.loadingAnimationButton,
                      height: Sizes.loadingAnimationButton,
                    )
                  : CustomButton(
                      text: tr(context).signIn,
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          ref
                              .read(authProvider.notifier)
                              .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
