

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/place_autocomplete.dart';
import '../../domain/entities/place_details.dart';
import '../../domain/use_cases/get_place_details_uc.dart';
import 'session_token_provider.dart';

part 'place_details_provider.g.dart';

@riverpod
Option<PlaceDetails> currentPlaceDetails(CurrentPlaceDetailsRef ref) {
  final Option<String> selectedPlaceId =
      ref.watch(selectedPlaceAutocompleteProvider.select(
    (value) => value.match(
      () => const None(),
      (autocomplete) => Some(autocomplete.placeId),
    ),
  ));

  return selectedPlaceId.flatMap(
    (placeId) =>
        ref.watch(getPlaceDetailsProvider(placeId).select(valueToOption)),
  );
}

@riverpod
class SelectedPlaceAutocomplete extends _$SelectedPlaceAutocomplete
    with NotifierUpdate {
  @override
  Option<PlaceAutocomplete> build() => const None();
}

@riverpod
Future<PlaceDetails> getPlaceDetails(
  GetPlaceDetailsRef ref,
  String placeId,
) async {
  ref.listenSelf((previous, next) {
    next.whenData((_) => ref.invalidate(sessionTokenProvider));
  });

  final cancelToken = ref.cancelToken();

  final params = GetPlaceDetailsParams(
    cancelToken: cancelToken,
    placeId: placeId,
  );
  final placeDetails = await ref.watch(getPlaceDetailsUCProvider).call(params);
  return placeDetails;
}
