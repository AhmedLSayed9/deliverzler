import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/get_user_data_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_with_email_uc_test.mocks.dart';

@GenerateMocks([IAuthRepo])
void main() {
  late MockIAuthRepo mockIAuthRepo;

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
      const tAuthUid = 'uid';

      test(
        'should return proper data when Repo.getUserData returns normally',
        () async {
          // GIVEN
          when(mockIAuthRepo.getUserData(tAuthUid))
              .thenAnswer((_) async => tUser);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(getUserDataUCProvider);
          final result = await useCase(tAuthUid);

          // THEN
          verify(mockIAuthRepo.getUserData(tAuthUid)).called(1);
          expect(result, tUser);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );

      test(
        'should throw same Exception when Repo.getUserData throws',
        () async {
          // GIVEN
          when(mockIAuthRepo.getUserData(tAuthUid)).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(getUserDataUCProvider);
          final call = useCase(tAuthUid);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockIAuthRepo.getUserData(tAuthUid)).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );
    },
  );
}
