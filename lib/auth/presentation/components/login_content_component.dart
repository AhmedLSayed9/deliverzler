import 'package:flutter/material.dart';

import '../../../core/presentation/styles/sizes.dart';
import 'login_form_component.dart';
import 'welcome_component.dart';

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
