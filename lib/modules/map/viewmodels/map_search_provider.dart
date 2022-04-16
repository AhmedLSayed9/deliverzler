import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:deliverzler/modules/map/repos/map_repo.dart';
import 'package:deliverzler/modules/map/viewmodels/selected_place_providers/selected_place_directions_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

final mapSearchProvider = StateNotifierProvider.autoDispose<MapSearchNotifier,
    List<PlaceSearchModel>>((ref) => MapSearchNotifier(ref));

class MapSearchNotifier extends StateNotifier<List<PlaceSearchModel>> {
  MapSearchNotifier(this.ref) : super([]);

  final Ref ref;

  String sessionToken = const Uuid().v4();
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();

  getPlaceSearchSuggestions(BuildContext context, String placeName) async {
    final _result = await MapRepo.instance.getPlaceSearchSuggestions(
      placeName: placeName,
      sessionToken: sessionToken,
    );
    _result.fold(
      (failure) {
        AppDialogs.showErrorDialog(
          context,
          message: failure?.message,
        );
      },
      (searchList) {
        state = searchList;
      },
    );
  }

  handleSearchItemOnTap({required PlaceSearchModel placeSearchModel}) {
    setSelectedPlace(placeSearchModel);
    closeSearchMenu();
    generateNewSessionToken();
  }

  setSelectedPlace(PlaceSearchModel placeSearchModel) {
    ref.read(selectedPlaceDirectionsProvider.notifier).setSelectedPlaceBySearch(
          placeSearchModel: placeSearchModel,
          sessionToken: sessionToken,
        );
  }

  closeSearchMenu() {
    floatingSearchBarController.close();
    state.clear();
  }

  generateNewSessionToken() {
    //Pass a unique session token for each new session.
    //Using the same token for more than one session will result in each request being billed individually.
    sessionToken = const Uuid().v4();
  }

  @override
  void dispose() {
    floatingSearchBarController.dispose();
    super.dispose();
  }
}
