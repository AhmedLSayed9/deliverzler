import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogoutComponent extends ConsumerWidget {
  const LogoutComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: () async {
        await ref.read(mainCoreProvider).logoutUser();
        NavigationService.pushReplacementAll(
          isNamed: true,
          page: RoutePaths.authLogin,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.vPaddingSmall(context),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            Sizes.dialogSmallRadius(context),
          ),
          border: Border.all(
            width: 1,
            color: AppColors.primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withOpacity(0.15),
              offset: const Offset(0, 3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: Sizes.hMarginSmall(context),
            ),
            CustomText.h4(
              context,
              tr(context).logOut,
              alignment: Alignment.center,
              weight: FontStyles.fontWeightExtraBold,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
