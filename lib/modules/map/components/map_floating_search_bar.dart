import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/map/components/map_search_menu_component.dart';
import 'package:deliverzler/modules/map/viewmodels/map_search_viewmodel.dart';

class MapFloatingSearchBar extends ConsumerWidget {
  const MapFloatingSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final mapSearchVM = ref.watch(mapSearchViewModel.notifier);

    return FloatingSearchBar(
      controller: mapSearchVM.floatingSearchBarController,
      height: Sizes.mapSearchBarHeight,
      margins: EdgeInsets.fromLTRB(Sizes.hMarginMedium,
          Sizes.mapSearchBarTopMargin, Sizes.hMarginMedium, 0),
      padding: EdgeInsets.symmetric(horizontal: Sizes.hPaddingTiny),
      borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
      elevation: 4,
      hint: tr(context).searchForAPlace,
      hintStyle: FontStyles.mapSearchBarFontStyle,
      queryStyle: FontStyles.mapSearchBarFontStyle,
      physics: const BouncingScrollPhysics(),
      transition: CircularFloatingSearchBarTransition(),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        mapSearchVM.getPlaceSearchSuggestions(
          placeName: query,
        );
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
        return const MapSearchMenuComponent();
      },
    );
  }
}
