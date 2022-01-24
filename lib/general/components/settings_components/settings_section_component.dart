import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/general/components/settings_components/settings_tile_component.dart';

class SettingsSectionComponent extends StatelessWidget {
  const SettingsSectionComponent({
    required this.headerIcon,
    required this.headerTitle,
    this.headerTrailing,
    required this.tileList,
    Key? key,
  }) : super(key: key);

  final IconData headerIcon;
  final String headerTitle;
  final Widget? headerTrailing;
  final List<SettingsTileComponent> tileList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Sizes.vMarginMedium,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(
          Sizes.dialogSmallRadius,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListView(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.vPaddingTiny,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              headerIcon,
            ),
            title: CustomText.h4(
              context,
              headerTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: headerTrailing,
          ),
          ...tileList,
        ],
      ),
    );
  }
}
