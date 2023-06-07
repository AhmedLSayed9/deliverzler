import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:deliverzler/core/core_features/locale/infrastructure/repos/locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../../../utils.dart';

class MockLocaleRepo extends Mock implements LocaleRepo {}

void main() {
  SharedPreferences.setMockInitialValues({'test': 'none'});
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockLocaleRepo mockLocaleRepo;

  setUp(() {
    mockLocaleRepo = MockLocaleRepo();
  });

  ProviderContainer setUpRepoContainer() {
    return setUpContainer(
      overrides: [
        localeRepoProvider.overrideWithValue(mockLocaleRepo),
      ],
    );
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
        'should emit AsyncData(tLocale) when LocaleRepo.getAppLocale returns normally',
        () async {
          // GIVEN
          when(() => mockLocaleRepo.getAppLocale())
              .thenAnswer((_) async => tLocale.code);

          final container = setUpRepoContainer();
          final listener =
              setUpListener(container, appLocaleControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(appLocaleControllerProvider.future);

          // THEN
          await expectLater(call, completion(tLocale));

          verifyInOrder([
            () => mockLocaleRepo.getAppLocale(),
            () => listener(loadingState, tLocaleState),
          ]);
          verifyNoMoreInteractions(mockLocaleRepo);
          verifyNoMoreInteractions(listener);
        },
      );
      test(
        'should emit AsyncError when LocaleRepo.getAppLocale throws',
        () async {
          // GIVEN
          when(() => mockLocaleRepo.getAppLocale()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpRepoContainer();
          final listener =
              setUpListener(container, appLocaleControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(appLocaleControllerProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockLocaleRepo.getAppLocale(),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockLocaleRepo);
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
        'should emit AsyncData(tChangeLocale) then call LocaleRepo.cacheAppLocale',
        () async {
          // GIVEN
          when(() => mockLocaleRepo.getAppLocale())
              .thenAnswer((_) async => tLocale.code);
          when(() => mockLocaleRepo.cacheAppLocale(any()))
              .thenAnswer((_) async => {});

          final container = setUpRepoContainer();
          await container.read(appLocaleControllerProvider.future);
          final listener =
              setUpListener(container, appLocaleControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, tLocaleState));
          verifyOnly(mockLocaleRepo, () => mockLocaleRepo.getAppLocale());

          final call = container
              .read(appLocaleControllerProvider.notifier)
              .changeLocale(tChangeLocale);

          // THEN
          await expectLater(call, completion(null));

          verifyInOrder([
            () => listener(tLocaleState, tChangeLocaleState),
            () => mockLocaleRepo.cacheAppLocale(tChangeLocale.code),
          ]);
          verifyNoMoreInteractions(mockLocaleRepo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
