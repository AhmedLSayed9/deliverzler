import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/set_user_data_uc.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';

class MockIAuthRepo extends Mock implements IAuthRepo {}

class MockUser extends Mock implements User {}

void main() {
  late MockIAuthRepo mockIAuthRepo;

  setUpAll(() {
    registerFallbackValue(MockUser());
  });

  setUp(() {
    mockIAuthRepo = MockIAuthRepo();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        authRepoProvider.overrideWithValue(mockIAuthRepo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  final tException = Exception('test_exception');

  group(
    'call',
    () {
      test(
        'should return same tUser value when Repo.setUserData returns normally',
        () async {
          // GIVEN
          when(() => mockIAuthRepo.setUserData(any()))
              .thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(setUserDataUCProvider);
          final result = await useCase(tUser);

          // THEN
          verify(() => mockIAuthRepo.setUserData(tUser)).called(1);
          expect(result, tUser);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );

      test(
        'should throw same Exception when Repo.setUserData throws',
        () async {
          // GIVEN
          when(() => mockIAuthRepo.setUserData(any())).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(setUserDataUCProvider);
          final call = useCase(tUser);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockIAuthRepo.setUserData(tUser)).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );
    },
  );
}
