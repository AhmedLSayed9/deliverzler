import 'package:flutter/material.dart';

import '../../../core/presentation/helpers/localization_helper.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../core/presentation/widgets/custom_button.dart';
import '../../domain/sign_in_with_email.dart';
import '../providers/sign_in_provider.dart';
import 'login_text_fields_section.dart';

class LoginFormComponent extends HookConsumerWidget {
  const LoginFormComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    void signIn() {
      if (loginFormKey.currentState!.validate()) {
        final params = SignInWithEmail(
          email: emailController.text,
          password: passwordController.text,
        );
        ref
            .read(signInWithEmailEventProvider.notifier)
            .update((_) => Some(Event.unique(params)));
      }
    }

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          LoginTextFieldsSection(
            emailController: emailController,
            passwordController: passwordController,
            onFieldSubmitted:
                ref.isLoading(signInStateProvider) ? null : (_) => signIn(),
          ),
          const SizedBox(
            height: Sizes.marginV40,
          ),
          CustomButton(
            text: tr(context).signIn,
            onPressed: ref.isLoading(signInStateProvider) ? null : signIn,
          ),
        ],
      ),
    );
  }
}
