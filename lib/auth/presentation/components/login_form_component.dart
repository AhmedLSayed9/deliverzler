import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/utils/functional.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../domain/use_cases/sign_in_with_email_uc.dart';
import '../providers/sign_in_provider.dart';
import 'login_text_fields_section.dart';

class LoginFormComponent extends HookConsumerWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    final signIn = useCallback(() {
      final bool canSubmit = !ref.read(signInStateProvider).isLoading;

      if (canSubmit && loginFormKey.currentState!.validate()) {
        final params = SignInWithEmailParams(
          email: emailController.text,
          password: passwordController.text,
        );
        ref
            .read(signInWithEmailEventProvider.notifier)
            .update((_) => Some(params));
      }
    }, []);

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          LoginTextFieldsSection(
            emailController: emailController,
            passwordController: passwordController,
            onFieldSubmitted: (value) {
              signIn();
            },
          ),
          const SizedBox(
            height: Sizes.marginV40,
          ),
          CustomButton(
            text: tr(context).signIn,
            onPressed: signIn,
          ),
        ],
      ),
    );
  }
}
