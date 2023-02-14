import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../providers/place_autocomplete_provider.dart';
import '../providers/place_details_provider.dart';
import '../widgets/map_search_menu_item.dart';

class MapSearchMenuComponent extends ConsumerWidget {
  const MapSearchMenuComponent({
    required this.searchBarController,
    Key? key,
  }) : super(key: key);

  final FloatingSearchBarController searchBarController;

  @override
  Widget build(BuildContext context, ref) {
    final placeSearchList =
        ref.watch(placeAutocompleteStateProvider).valueOrNull ?? [];

    return placeSearchList.isNotEmpty
        ? Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.paddingV14,
                horizontal: Sizes.paddingH14,
              ),
              itemCount: placeSearchList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
                  onTap: () {
                    searchBarController.close();
                    ref
                        .read(selectedPlaceAutocompleteProvider.notifier)
                        .update((_) => Some(placeSearchList[index]));
                  },
                  child: MapSearchMenuItem(
                    placeAutocomplete: placeSearchList[index],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider(
                  height: Sizes.paddingV14,
                );
              },
            ),
          )
        : const SizedBox();
  }
}
