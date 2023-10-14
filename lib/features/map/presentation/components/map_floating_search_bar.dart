import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/hooks/floating_search_bar_controller_hook.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../providers/place_autocomplete_provider.dart';
import 'map_search_menu_component.dart';

class MapFloatingSearchBar extends HookConsumerWidget {
  const MapFloatingSearchBar({super.key});

  TextStyle _searchBarTextStyle(BuildContext context) => TextStyles.f16(context).copyWith(
        color: Theme.of(context).textTheme.titleMedium!.color,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBarController = useFloatingSearchBarController();

    return FloatingSearchBar(
      controller: searchBarController,
      automaticallyImplyDrawerHamburger: false,
      height: 60,
      margins: const EdgeInsets.fromLTRB(Sizes.marginH16, 44, Sizes.marginH16, 0),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.paddingH4),
      borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
      hint: tr(context).searchForAPlace,
      hintStyle: _searchBarTextStyle(context),
      queryStyle: _searchBarTextStyle(context),
      physics: const BouncingScrollPhysics(),
      transition: CircularFloatingSearchBarTransition(),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      debounceDelay: const Duration(milliseconds: 300),
      onQueryChanged: (query) {
        if (query.isNotEmpty) {
          ref.read(placeAutocompleteQueryProvider.notifier).update((_) => Some(query));
        } else {
          ref.read(placeAutocompleteQueryProvider.notifier).update((_) => const None());
        }
      },
      actions: [
        FloatingSearchBarAction.icon(
          icon: Icon(
            Icons.place,
            color: Theme.of(context).textTheme.titleMedium!.color,
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
