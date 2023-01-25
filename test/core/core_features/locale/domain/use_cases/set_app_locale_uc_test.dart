import 'package:deliverzler/core/core_features/locale/data/repos/locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/domain/repos/i_locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/domain/use_cases/set_app_locale_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockILocaleRepo extends Mock implements ILocaleRepo {}

void main() {
  late MockILocaleRepo mockILocaleRepo;

  setUp(() {
    mockILocaleRepo = MockILocaleRepo();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        localeRepoProvider.overrideWithValue(mockILocaleRepo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tLocale = 'en';

  final tException = Exception('test_exception');

  group(
    'call',
    () {
      test(
        'should return proper data when Repo.cacheAppLocale returns normally',
        () async {
          // GIVEN
          when(() => mockILocaleRepo.cacheAppLocale(tLocale))
              .thenAnswer((_) async => Future.value());
          final container = setUpContainer();

          // WHEN
          final setAppLocaleUC = container.read(setAppLocaleUCProvider);
          await setAppLocaleUC(tLocale);

          // THEN
          verify(() => mockILocaleRepo.cacheAppLocale(tLocale));
          verifyNoMoreInteractions(mockILocaleRepo);
        },
      );

      test(
        'should throw same Exception when Repo.cacheAppLocale throws',
        () async {
          // GIVEN
          when(() => mockILocaleRepo.cacheAppLocale(tLocale))
              .thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final setAppLocaleUC = container.read(setAppLocaleUCProvider);
          final call = setAppLocaleUC(tLocale);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockILocaleRepo.cacheAppLocale(tLocale)).called(1);
          verifyNoMoreInteractions(mockILocaleRepo);
        },
      );
    },
  );
}
