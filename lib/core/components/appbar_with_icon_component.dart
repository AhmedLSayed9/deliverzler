import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class AppBarWithIconComponent extends StatelessWidget {
  final String icon;
  final String title;

  const AppBarWithIconComponent({
    required this.icon,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage(
            icon,
          ),
          color: Theme.of(context).iconTheme.color,
          size: Sizes.appBarIconSize(context),
        ),
        SizedBox(
          width: Sizes.hMarginComment(context),
        ),
        CustomText.h2(
          context,
          title,
          weight: FontStyles.fontWeightSemiBold,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
