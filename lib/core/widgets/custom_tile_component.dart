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
    return Material(
      child: ListTile(
        dense: true,
        contentPadding: contentPadding,
        minLeadingWidth: 0.0,
        horizontalTitleGap: Sizes.hMarginSmallest(context),
        title: CustomText.h5(
          context,
          title,
          color: Theme.of(context).textTheme.headline4!.color,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: customLeading ??
            (leadingIcon != null
                ? Icon(
                    leadingIcon,
                    size: Sizes.iconsSizes(context)['s6'],
                    color: leadingIconColor ??
                        Theme.of(context).textTheme.headline4!.color,
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
      ),
    );
  }
}
