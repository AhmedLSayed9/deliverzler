import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../styles/sizes.dart';
import 'custom_text.dart';

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
    Key? key,
  })  : assert((trailingText == null || customTrailing == null) &&
            (leadingIcon == null || customLeading == null)),
        super(key: key);

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
        minLeadingWidth: 0.0,
        horizontalTitleGap: Sizes.marginH8,
        title: CustomText.f16(
          context,
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: customLeading ??
            (leadingIcon != null
                ? Icon(
                    leadingIcon,
                    size: Sizes.icon16,
                    color:
                        leadingIconColor ?? customColors(context).font16Color,
                  )
                : null),
        trailing: customTrailing ??
            (trailingText != null
                ? FittedBox(
                    child: CustomText.f14(
                      context,
                      trailingText!,
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
