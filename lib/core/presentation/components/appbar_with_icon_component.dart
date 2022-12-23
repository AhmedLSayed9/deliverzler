import 'package:flutter/material.dart';

import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../widgets/custom_text.dart';

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
          size: Sizes.icon24,
        ),
        const SizedBox(
          width: Sizes.marginH8,
        ),
        CustomText.f20(
          context,
          title,
          weight: FontStyles.fontWeightSemiBold,
        ),
      ],
    );
  }
}
