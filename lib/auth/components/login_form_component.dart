import 'package:deliverzler/auth/components/login_text_fields_section.dart';
import 'package:deliverzler/auth/viewmodels/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
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
          LoginTextFieldsSection(
            emailController: _emailController,
            passwordController: _passwordController,
            onFieldSubmitted: (value) {
              if (_loginFormKey.currentState!.validate()) {
                ref.read(authProvider.notifier).signInWithEmailAndPassword(
                      context,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
              }
            },
          ),
          SizedBox(
            height: Sizes.vMarginSmall(context),
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
                      width: Sizes.loadingAnimationButton(context),
                      height: Sizes.loadingAnimationButton(context),
                    )
                  : CustomButton(
                      text: tr(context).signIn,
                      onPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          ref
                              .watch(authProvider.notifier)
                              .signInWithEmailAndPassword(
                                context,
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
