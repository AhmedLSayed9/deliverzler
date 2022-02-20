import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:deliverzler/modules/map/repos/map_repo.dart';
import 'package:deliverzler/modules/map/viewmodels/map_selected_place_viewmodel.dart';
import 'package:uuid/uuid.dart';

final mapSearchViewModel =
    ChangeNotifierProvider.autoDispose<MapSearchViewModel>(
        (ref) => MapSearchViewModel(ref));

class MapSearchViewModel extends ChangeNotifier {
  MapSearchViewModel(this.ref);

  Ref ref;
  bool isLoading = false;
  bool _disposed = false;

  String sessionToken = const Uuid().v4();
  final FloatingSearchBarController floatingSearchBarController =
      FloatingSearchBarController();
  List<PlaceSearchModel> placeSearchList = [];

  getPlaceSearchSuggestions({required String placeName}) async {
    final _result = await MapRepo.instance.getPlaceSearchSuggestions(
      placeName: placeName,
      sessionToken: sessionToken,
    );
    _result.fold(
      (l) {
        AppDialogs.showServerErrorDialog(message: l?.message);
      },
      (r) {
        placeSearchList = r;
        notifyListeners();
      },
    );
  }

  handleSearchItemOnTap({required PlaceSearchModel placeSearchModel}) {
    initSelectedPlace(placeSearchModel);
    closeSearchMenu();
    generateNewSessionToken();
  }

  initSelectedPlace(PlaceSearchModel placeSearchModel) {
    ref.read(mapSelectedPlaceViewModel).initSelectedPlaceBySearch(
          placeSearchModel: placeSearchModel,
          sessionToken: sessionToken,
        );
  }

  closeSearchMenu() {
    floatingSearchBarController.close();
    placeSearchList.clear();
  }

  generateNewSessionToken() {
    //Pass a unique session token for each new session.
    //Using the same token for more than one session will result in each request being billed individually.
    sessionToken = const Uuid().v4();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
