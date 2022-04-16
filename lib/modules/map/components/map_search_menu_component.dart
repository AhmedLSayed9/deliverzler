import 'package:deliverzler/modules/map/viewmodels/map_search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/map/widgets/map_search_menu_item.dart';

class MapSearchMenuComponent extends ConsumerWidget {
  const MapSearchMenuComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _placeSearchList = ref.watch(mapSearchProvider);

    return _placeSearchList.isNotEmpty
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
                vertical: Sizes.vPaddingSmall(context),
                horizontal: Sizes.hMarginSmall(context),
              ),
              itemCount: _placeSearchList.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(
                    Sizes.mapSearchBarRadius(context),
                  ),
                  onTap: () {
                    ref.watch(mapSearchProvider.notifier).handleSearchItemOnTap(
                          placeSearchModel: _placeSearchList[index],
                        );
                  },
                  child: MapSearchMenuItem(
                    placeSearchModel: _placeSearchList[index],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return Divider(
                  height: Sizes.vPaddingSmall(context),
                );
              },
            ),
          )
        : const SizedBox();
  }
}
