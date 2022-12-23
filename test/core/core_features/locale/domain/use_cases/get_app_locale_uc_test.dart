import 'package:deliverzler/core/core_features/locale/data/repos/locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/domain/repos/i_locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/domain/use_cases/get_app_locale_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_app_locale_uc_test.mocks.dart';

@GenerateMocks([ILocaleRepo])
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

  //Since GetAppLocaleUC has no real logic. It will just get data from the Repository.
  //Therefore, the test will ensure that the Repository is actually called
  //and that the data simply passes unchanged through the use case.
  group(
    'call',
    () {
      test(
        'should return proper data when Repo.getAppLocale returns normally',
        () async {
          // GIVEN
          when(mockILocaleRepo.getAppLocale()).thenAnswer((_) async => tLocale);
          final container = setUpContainer();

          // WHEN
          final getAppLocaleUC = container.read(getAppLocaleUCProvider);
          final result = await getAppLocaleUC();

          // THEN
          verify(mockILocaleRepo.getAppLocale()).called(1);
          expect(result, tLocale);
          verifyNoMoreInteractions(mockILocaleRepo);
        },
      );

      test(
        'should throw same Exception when Repo.getAppLocale throws',
        () async {
          // GIVEN
          when(mockILocaleRepo.getAppLocale()).thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final getAppLocaleUC = container.read(getAppLocaleUCProvider);
          final call = getAppLocaleUC();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockILocaleRepo.getAppLocale()).called(1);
          verifyNoMoreInteractions(mockILocaleRepo);
        },
      );
    },
  );
}
