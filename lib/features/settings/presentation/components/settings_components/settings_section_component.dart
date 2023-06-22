import 'package:flutter/material.dart';

import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';
import '../../../../../core/presentation/widgets/custom_tile_component.dart';

class SettingsSectionComponent extends StatelessWidget {
  const SettingsSectionComponent({
    required this.headerIcon,
    required this.headerTitle,
    required this.tileList, this.headerTrailing,
    super.key,
  });

  final IconData headerIcon;
  final String headerTitle;
  final Widget? headerTrailing;
  final List<CustomTileComponent> tileList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: Sizes.marginV20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(Sizes.dialogR6),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor.withOpacity(0.15),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: Sizes.paddingV4),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Material(
            child: ListTile(
              horizontalTitleGap: 0,
              leading: Icon(
                headerIcon,
              ),
              title: CustomText.f16(
                context,
                headerTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: headerTrailing,
            ),
          ),
          ...tileList,
        ],
      ),
    );
  }
}
