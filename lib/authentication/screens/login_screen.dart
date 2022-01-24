import 'package:deliverzler/core/styles/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/authentication/components/app_logo_component.dart';
import 'package:deliverzler/authentication/components/login_form_component.dart';
import 'package:deliverzler/authentication/components/welcome_component.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return PopUpPage(
      child: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppImages.loginBackground,
              ),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingHigh,
            horizontal: Sizes.screenHPaddingDefault,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogoComponent(),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const WelcomeComponent(),
              SizedBox(
                height: Sizes.vMarginHigh,
              ),
              const LoginFormComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
