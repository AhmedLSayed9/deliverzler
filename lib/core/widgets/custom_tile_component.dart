import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

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
    return ListTile(
      dense: true,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            horizontal: Sizes.hPaddingHigh(context),
          ),
      horizontalTitleGap: Sizes.hMarginSmall(context),
      title: CustomText.h4(
        context,
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: customLeading ??
          (leadingIcon != null
              ? Icon(
                  leadingIcon,
                  size: Sizes.iconsSizes(context)['s4'],
                  color:
                      leadingIconColor ?? Theme.of(context).colorScheme.primary,
                )
              : null),
      trailing: customTrailing ??
          (trailingText != null
              ? FittedBox(
                  child: CustomText.h5(
                    context,
                    trailingText!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              : null),
      onTap: onTap,
    );
  }
}
