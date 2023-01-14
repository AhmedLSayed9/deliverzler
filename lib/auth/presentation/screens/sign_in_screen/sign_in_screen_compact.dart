import 'package:deliverzler/auth/presentation/components/login_logo_component.dart';
import 'package:deliverzler/auth/presentation/components/login_content_component.dart';
import 'package:deliverzler/core/presentation/screens/full_screen_platfom_scaffold.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class SignInScreenCompact extends StatelessWidget {
  const SignInScreenCompact({Key? key}) : super(key: key);

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
                  child: Column(
                    children: const [
                      Flexible(
                        flex: 1,
                        child: LoginLogoComponent(),
                      ),
                      SizedBox(
                        height: Sizes.marginV12,
                      ),
                      Flexible(
                        flex: 2,
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
