import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/map/viewmodels/map_search_viewmodel.dart';
import 'package:deliverzler/modules/map/widgets/map_search_menu_item.dart';

class MapSearchMenuComponent extends ConsumerWidget {
  const MapSearchMenuComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final mapSearchVM = ref.watch(mapSearchViewModel);

    return mapSearchVM.placeSearchList.isNotEmpty
        ? Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: Sizes.vPaddingSmall,
                horizontal: Sizes.hMarginSmall,
              ),
              itemCount: mapSearchVM.placeSearchList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(Sizes.mapSearchBarRadius),
                  onTap: () {
                    mapSearchVM.handleSearchItemOnTap(
                      placeSearchModel: mapSearchVM.placeSearchList[index],
                    );
                  },
                  child: MapSearchMenuItem(
                    placeSearchModel: mapSearchVM.placeSearchList[index],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: Sizes.vPaddingSmall,
                );
              },
            ),
          )
        : const SizedBox();
  }
}
