import 'package:deliverzler/core/presentation/hooks/floating_search_bar_controller_hook.dart';
import 'package:deliverzler/features/map/presentation/components/map_search_menu_component.dart';
import 'package:deliverzler/features/map/presentation/providers/place_autocomplete_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class MapFloatingSearchBar extends HookConsumerWidget {
  const MapFloatingSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final searchBarController = useFloatingSearchBarController();

    return FloatingSearchBar(
      controller: searchBarController,
      automaticallyImplyDrawerHamburger: false,
      height: Sizes.mapSearchBarHeight,
      margins: const EdgeInsets.fromLTRB(
        Sizes.marginH16,
        Sizes.marginV44,
        Sizes.marginH16,
        0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingH4),
      borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
      elevation: 4,
      hint: tr(context).searchForAPlace,
      hintStyle: FontStyles.mapSearchBarFontStyle(context),
      queryStyle: FontStyles.mapSearchBarFontStyle(context),
      physics: const BouncingScrollPhysics(),
      transition: CircularFloatingSearchBarTransition(),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      debounceDelay: const Duration(milliseconds: 300),
      onQueryChanged: (query) {
        if (query.isNotEmpty) {
          ref
              .read(placeAutocompleteQueryProvider.notifier)
              .update((_) => Some(query));
        }
      },
      actions: [
        FloatingSearchBarAction.icon(
          showIfOpened: false,
          icon: Icon(
            Icons.place,
            color: Theme.of(context).textTheme.subtitle1!.color,
          ),
          onTap: () {},
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return MapSearchMenuComponent(
          searchBarController: searchBarController,
        );
      },
    );
  }
}
