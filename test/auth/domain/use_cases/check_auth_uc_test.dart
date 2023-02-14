import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/check_auth_uc.dart';
import 'package:deliverzler/auth/domain/use_cases/get_user_data_uc.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_out_uc.dart';

class MockIAuthRepo extends Mock implements IAuthRepo {}

class MockGetUserDataUC extends Mock implements GetUserDataUC {}

class MockSignOutUC extends Mock implements SignOutUC {}

void main() {
  late MockIAuthRepo mockIAuthRepo;
  late MockGetUserDataUC mockGetUserDataUC;
  late MockSignOutUC mockSignOutUC;

  setUp(() {
    mockIAuthRepo = MockIAuthRepo();
    mockGetUserDataUC = MockGetUserDataUC();
    mockSignOutUC = MockSignOutUC();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        authRepoProvider.overrideWithValue(mockIAuthRepo),
        getUserDataUCProvider.overrideWithValue(mockGetUserDataUC),
        signOutUCProvider.overrideWithValue(mockSignOutUC),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tUid = '1';

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
        'should call GetUserDataUC when Repo.getUserAuthUid returns normally'
        'then return proper data when GetUserDataUC returns normally',
        () async {
          // GIVEN
          when(()=>mockIAuthRepo.getUserAuthUid()).thenAnswer((_) async => tUid);
          when(()=>mockGetUserDataUC(tUid)).thenAnswer((_) async => tUser);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(checkAuthUCProvider);
          final result = await useCase();

          // THEN
          verify(()=>mockIAuthRepo.getUserAuthUid()).called(1);

          verify(()=>mockGetUserDataUC(tUid)).called(1);
          expect(result, tUser);

          verifyNoMoreInteractions(mockIAuthRepo);
          verifyNoMoreInteractions(mockGetUserDataUC);
        },
      );

      test(
        'should call GetUserDataUC when Repo.getUserAuthUid returns normally'
        'then call SignOutUCProvider and rethrow same Exception when GetUserDataUC throws',
        () async {
          // GIVEN
          when(()=>mockIAuthRepo.getUserAuthUid()).thenAnswer((_) async => tUid);
          when(()=>mockGetUserDataUC(tUid)).thenThrow(tException);
          when(()=>mockIAuthRepo.signOut()).thenAnswer((_) async => Future.value());
          when(()=>mockSignOutUC()).thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(checkAuthUCProvider);
          final call = useCase();

          // THEN
          await expectLater(() => call, throwsA(tException));

          verify(()=>mockIAuthRepo.getUserAuthUid()).called(1);

          verify(()=>mockGetUserDataUC(tUid)).called(1);
          verify(()=>mockSignOutUC()).called(1);

          verifyNoMoreInteractions(mockIAuthRepo);
          verifyNoMoreInteractions(mockGetUserDataUC);
          verifyNoMoreInteractions(mockSignOutUC);
        },
      );

      test(
        'should throw same Exception when Repo.getUserAuthUid throws',
        () async {
          // GIVEN
          when(()=>mockIAuthRepo.getUserAuthUid()).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(checkAuthUCProvider);
          final call = useCase();

          // THEN
          await expectLater(() => call, throwsA(tException));

          verify(()=>mockIAuthRepo.getUserAuthUid()).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );
    },
  );
}
