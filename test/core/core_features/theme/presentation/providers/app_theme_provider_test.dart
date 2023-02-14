import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/theme/domain/use_cases/get_app_theme_uc.dart';
import 'package:deliverzler/core/core_features/theme/domain/use_cases/set_app_theme_uc.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/app_theme_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';

class MockGetAppThemeUC extends Mock implements GetAppThemeUC {}

class MockSetAppThemeUC extends Mock implements SetAppThemeUC {}

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

void main() {
  late MockGetAppThemeUC mockGetAppThemeUC;
  late MockSetAppThemeUC mockSetAppThemeUC;

  setUp(() {
    mockGetAppThemeUC = MockGetAppThemeUC();
    mockSetAppThemeUC = MockSetAppThemeUC();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        getAppThemeUCProvider.overrideWithValue(mockGetAppThemeUC),
        setAppThemeUCProvider.overrideWithValue(mockSetAppThemeUC),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  Listener setUpListener(ProviderContainer container) {
    final listener = Listener<AsyncValue<AppTheme>>();
    container.listen(
      appThemeControllerProvider,
      listener,
      fireImmediately: true,
    );
    return listener;
  }

  const tTheme = AppTheme.light;
  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  const loadingState = AsyncLoading<AppTheme>();
  const tThemeState = AsyncData<AppTheme>(tTheme);
  final errorState = AsyncError<AppTheme>(tException, tStackTrace);

  group(
    'build (getUserStoredTheme)',
    () {
      test(
        'should emit AsyncData(tTheme) when use case returns normally',
        () async {
          // GIVEN
          when(() => mockGetAppThemeUC()).thenAnswer((_) async => tTheme.name);

          final container = setUpContainer();
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, completion(tTheme));

          verifyInOrder([
            () => mockGetAppThemeUC(),
            () => listener(loadingState, tThemeState),
          ]);
          verifyNoMoreInteractions(mockGetAppThemeUC);
          verifyNoMoreInteractions(listener);
        },
      );
      test(
        'should emit AsyncError when use case throws',
        () async {
          // GIVEN
          when(() => mockGetAppThemeUC()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer();
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockGetAppThemeUC(),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockGetAppThemeUC);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'changeTheme',
    () {
      const tChangeTheme = AppTheme.dark;
      const tChangeThemeState = AsyncData<AppTheme>(tChangeTheme);

      test(
        'should emit AsyncData(tChangeTheme) then call the concrete use case',
        () async {
          // GIVEN
          when(() => mockGetAppThemeUC()).thenAnswer((_) async => tTheme.name);
          when(() => mockSetAppThemeUC(any()))
              .thenAnswer((_) async => Future.value());

          final container = setUpContainer();
          await container.read(appThemeControllerProvider.future);
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, tThemeState));
          verifyNoMoreInteractions(listener);

          final call = container
              .read(appThemeControllerProvider.notifier)
              .changeTheme(tChangeTheme);

          // THEN
          await expectLater(call, completion(null));

          verifyInOrder([
            () => listener(tThemeState, tChangeThemeState),
            () => mockSetAppThemeUC(tChangeTheme.name),
          ]);
          verifyNoMoreInteractions(mockSetAppThemeUC);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
