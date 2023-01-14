import 'package:deliverzler/auth/presentation/components/login_form_component.dart';
import 'package:deliverzler/auth/presentation/components/welcome_component.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:flutter/material.dart';

class LoginContentComponent extends StatelessWidget {
  const LoginContentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: Sizes.maxWidth360,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          WelcomeComponent(),
          SizedBox(
            height: Sizes.marginV32,
          ),
          LoginFormComponent(),
        ],
      ),
    );
  }
}
