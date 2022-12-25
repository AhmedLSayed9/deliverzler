import 'package:deliverzler/core/presentation/extensions/auto_dispose_ref_extension.dart';
import 'package:deliverzler/core/presentation/helpers/option_helper.dart';
import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';
import 'package:deliverzler/features/map/domain/entities/place_details.dart';
import 'package:deliverzler/features/map/domain/use_cases/get_place_details_uc.dart';
import 'package:deliverzler/features/map/presentation/providers/session_token_provider.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

final selectedPlaceAutocompleteProvider =
    StateProvider.autoDispose<Option<PlaceAutocomplete>>((ref) {
  return const None();
});

class AbortedException implements Exception {}

@riverpod
Future<PlaceDetails> getPlaceDetails(
  GetPlaceDetailsRef ref,
  String placeId,
) async {
  final cancelToken = ref.cancelToken();

  final params = GetPlaceDetailsParams(
    cancelToken: cancelToken,
    placeId: placeId,
  );
  final placeDetails = await ref.watch(getPlaceDetailsUCProvider).call(params);
  ref.invalidate(sessionTokenProvider);
  return placeDetails;
}
