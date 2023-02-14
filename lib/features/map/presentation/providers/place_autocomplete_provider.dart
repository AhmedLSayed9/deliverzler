import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../domain/entities/place_autocomplete.dart';
import '../../domain/use_cases/get_place_autocomplete_uc.dart';

part 'place_autocomplete_provider.g.dart';

@riverpod
AsyncValue<List<PlaceAutocomplete>> placeAutocompleteState(
  PlaceAutocompleteStateRef ref,
) {
  final query = ref.watch(placeAutocompleteQueryProvider);
  return query.match(
    () => const AsyncData([]),
    (query) => ref.watch(getPlaceAutocompleteProvider(query)),
  );
}

@riverpod
class PlaceAutocompleteQuery extends _$PlaceAutocompleteQuery
    with NotifierUpdate {
  @override
  Option<String> build() => const None();
}

@riverpod
Future<List<PlaceAutocomplete>> getPlaceAutocomplete(
  GetPlaceAutocompleteRef ref,
  String autocompleteQuery,
) async {
  final cancelToken = ref.cancelToken();

  // Debouncing the request. By having this delay, it leaves the opportunity
  // for consumers to subscribe to a different `autocompleteQuery` parameter.
  // In which case, this request will be aborted.
  await Future<void>.delayed(const Duration(milliseconds: 300));
  if (cancelToken.isCancelled) throw AbortedException();

  final params = GetPlaceAutocompleteParams(
    cancelToken: cancelToken,
    placeName: autocompleteQuery,
  );
  final places = await ref.watch(getPlaceAutocompleteUCProvider).call(params);
  return places;
}
