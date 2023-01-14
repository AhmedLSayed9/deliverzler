import 'package:deliverzler/auth/presentation/components/login_logo_component.dart';
import 'package:deliverzler/auth/presentation/components/login_content_component.dart';
import 'package:deliverzler/core/presentation/screens/full_screen_platfom_scaffold.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class SignInScreenMedium extends StatelessWidget {
  const SignInScreenMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FullScreenPlatformScaffold(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.loginBackground,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.screenMarginV16,
                    horizontal: Sizes.screenMarginH28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        flex: 2,
                        child: LoginLogoComponent(),
                      ),
                      SizedBox(
                        width: Sizes.marginH16,
                      ),
                      Flexible(
                        flex: 3,
                        child: LoginContentComponent(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
