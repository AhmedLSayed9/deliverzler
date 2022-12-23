import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

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
          size: Sizes.icon24(context),
        ),
        SizedBox(
          width: Sizes.marginH10(context),
        ),
        CustomText.f24(
          context,
          title,
          weight: FontStyles.fontWeightSemiBold,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
