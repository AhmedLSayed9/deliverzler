import 'package:deliverzler/features/map/presentation/providers/place_autocomplete_provider.dart';
import 'package:deliverzler/features/map/presentation/providers/place_details_provider.dart';
import 'package:deliverzler/features/map/presentation/widgets/map_search_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
              borderRadius:
                  BorderRadius.circular(Sizes.mapSearchBarRadius(context)),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: Sizes.paddingV16(context),
                horizontal: Sizes.marginH16(context),
              ),
              itemCount: placeSearchList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(
                    Sizes.mapSearchBarRadius(context),
                  ),
                  onTap: () {
                    searchBarController.close();
                    ref.read(selectedPlaceAutocompleteProvider.notifier).state =
                        Some(placeSearchList[index]);
                  },
                  child: MapSearchMenuItem(
                    placeAutocomplete: placeSearchList[index],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: Sizes.paddingV16(context),
                );
              },
            ),
          )
        : const SizedBox();
  }
}
