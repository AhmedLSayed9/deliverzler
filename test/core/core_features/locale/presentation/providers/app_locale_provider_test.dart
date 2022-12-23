import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/locale/domain/use_cases/get_app_locale_uc.dart';
import 'package:deliverzler/core/core_features/locale/domain/use_cases/set_app_locale_uc.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'app_locale_provider_test.mocks.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

@GenerateMocks([GetAppLocaleUC])
@GenerateMocks([SetAppLocaleUC])
void main() {
  late MockGetAppLocaleUC mockGetAppLocaleUC;
  late MockSetAppLocaleUC mockSetAppLocaleUC;

  setUp(() {
    mockGetAppLocaleUC = MockGetAppLocaleUC();
    mockSetAppLocaleUC = MockSetAppLocaleUC();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        getAppLocaleUCProvider.overrideWithValue(mockGetAppLocaleUC),
        setAppLocaleUCProvider.overrideWithValue(mockSetAppLocaleUC),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  Listener setUpListener(ProviderContainer container) {
    final listener = Listener<AsyncValue<AppLocale>>();
    container.listen(
      appLocaleControllerProvider,
      listener,
      fireImmediately: true,
    );
    return listener;
  }

  const tLocale = AppLocale.english;
  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  const loadingState = AsyncLoading<AppLocale>();
  const tLocaleState = AsyncData<AppLocale>(tLocale);
  final errorState = AsyncError<AppLocale>(tException, tStackTrace);

  group(
    'build (getUserStoredLocale)',
    () {
      test(
        'should emit AsyncData(tLocale) when use case returns normally',
        () async {
          // GIVEN
          when(mockGetAppLocaleUC()).thenAnswer((_) async => tLocale.code);

          final container = setUpContainer();
          final listener = setUpListener(container);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(appLocaleControllerProvider.future);

          // THEN
          await expectLater(call, completion(tLocale));

          verifyInOrder([
            mockGetAppLocaleUC(),
            listener(loadingState, tLocaleState),
          ]);
          verifyNoMoreInteractions(mockGetAppLocaleUC);
          verifyNoMoreInteractions(listener);
        },
      );
      test(
        'should emit AsyncError when use case throws',
        () async {
          // GIVEN
          when(mockGetAppLocaleUC()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer();
          final listener = setUpListener(container);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(appLocaleControllerProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            mockGetAppLocaleUC(),
            listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockGetAppLocaleUC);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'changeLocale',
    () {
      const tChangeLocale = AppLocale.arabic;
      const tChangeLocaleState = AsyncData<AppLocale>(tChangeLocale);

      test(
        'should emit AsyncData(tChangeLocale) then call the concrete use case',
        () async {
          // GIVEN
          when(mockGetAppLocaleUC()).thenAnswer((_) async => tLocale.code);
          when(mockSetAppLocaleUC(any))
              .thenAnswer((_) async => returnsNormally);

          final container = setUpContainer();
          await container.read(appLocaleControllerProvider.future);
          final listener = setUpListener(container);

          // WHEN
          verify(listener(null, tLocaleState));
          verifyNoMoreInteractions(listener);

          final call = container
              .read(appLocaleControllerProvider.notifier)
              .changeLocale(tChangeLocale);

          // THEN
          await expectLater(call, completion(null));

          verifyInOrder([
            listener(tLocaleState, tChangeLocaleState),
            mockSetAppLocaleUC(tChangeLocale.code),
          ]);
          verifyNoMoreInteractions(mockSetAppLocaleUC);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
