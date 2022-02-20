import 'package:flutter/material.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class SettingsTileComponent extends StatelessWidget {
  const SettingsTileComponent({
    this.title,
    this.customTitle,
    this.trailing,
    this.customTrailing,
    this.onTap,
    Key? key,
  })  : assert((title != null || customTitle != null) &&
            (trailing != null || customTrailing != null)),
        super(key: key);

  final String? title;
  final Widget? customTitle;
  final String? trailing;
  final Widget? customTrailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: customTitle ??
          CustomText.h5(
            context,
            title!,
            color: Theme.of(context).textTheme.headline4!.color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
      trailing: customTrailing ??
          FittedBox(
            child: CustomText.h5(
              context,
              trailing!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      onTap: onTap,
    );
  }
}
