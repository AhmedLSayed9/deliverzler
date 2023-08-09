import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/custom_colors.dart';
import '../styles/styles.dart';

class CustomTileComponent extends StatelessWidget {
  const CustomTileComponent({
    required this.title,
    this.leadingIcon,
    this.leadingIconColor,
    this.customLeading,
    this.trailingText,
    this.customTrailing,
    this.onTap,
    this.contentPadding,
    super.key,
  }) : assert(
          (trailingText == null || customTrailing == null) &&
              (leadingIcon == null || customLeading == null),
          'Either trailingText or customTrailing should be null '
          'Either leadingIcon or customLeading should be null',
        );

  final String title;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final Widget? customLeading;
  final String? trailingText;
  final Widget? customTrailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        dense: true,
        contentPadding: contentPadding,
        minLeadingWidth: 0,
        horizontalTitleGap: Sizes.marginH8,
        title: Text(
          title,
          style: TextStyles.f16(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: customLeading ??
            (leadingIcon != null
                ? Icon(
                    leadingIcon,
                    size: Sizes.icon16,
                    color: leadingIconColor ?? customColors(context).font16Color,
                  )
                : null),
        trailing: customTrailing ??
            (trailingText != null
                ? FittedBox(
                    child: Text(
                      trailingText!,
                      style: TextStyles.f14(context),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : null),
        onTap: onTap,
      ),
    );
  }
}
