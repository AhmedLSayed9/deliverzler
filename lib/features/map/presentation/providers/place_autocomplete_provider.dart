import 'dart:async';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/place_autocomplete.dart';
import '../../infrastructure/repos/map_repo.dart';

part 'place_autocomplete_provider.g.dart';

@riverpod
FutureOr<List<PlaceAutocomplete>> placeAutocompleteState(
  PlaceAutocompleteStateRef ref,
) {
  final query = ref.watch(placeAutocompleteQueryProvider);
  return query.match(
    () => const [],
    (query) => ref.watch(getPlaceAutocompleteProvider(query).future),
  );
}

@riverpod
class PlaceAutocompleteQuery extends _$PlaceAutocompleteQuery with NotifierUpdate {
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

  final places = await ref
      .watch(mapRepoProvider)
      .getPlaceAutocomplete(autocompleteQuery, cancelToken: cancelToken);
  return places;
}
