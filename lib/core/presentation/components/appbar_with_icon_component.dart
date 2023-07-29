import 'package:flutter/material.dart';

import '../styles/styles.dart';

class AppBarWithIconComponent extends StatelessWidget {
  const AppBarWithIconComponent({
    required this.icon,
    required this.title,
    super.key,
  });
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
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
        Text(
          title,
          style: TextStyles.f20(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold),
        ),
      ],
    );
  }
}
