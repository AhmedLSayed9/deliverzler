import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/check_auth_provider.dart';
import 'package:deliverzler/core/infrastructure/network/network_info.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAuthRepo extends Mock implements AuthRepo {}

class MockSignOutState extends AutoDisposeAsyncNotifier<Option<Unit>>
    with Mock
    implements SignOutState {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late MockSignOutState mockSignOutState;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockSignOutState = MockSignOutState();
  });

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  const loadingState = AsyncLoading<User>();
  final errorState = AsyncError<User>(tException, tStackTrace);
  const dataState = AsyncData<User>(tUser);

  const authenticatedState = Some<User>(tUser);
  const unauthenticatedState = None();

  test(
    'should emit AsyncData(user) when AuthRepo.getUserAuthUid & AuthRepo.getUserData returns normally '
    'and authenticate user',
    () async {
      // GIVEN
      when(() => mockAuthRepo.getUserAuthUid()).thenAnswer((_) => Future.value(tUser.id));
      when(() => mockAuthRepo.getUserData(tUser.id)).thenAnswer((_) => Future.value(tUser));

      final container = setUpContainer(
        overrides: [
          authRepoProvider.overrideWithValue(mockAuthRepo),
        ],
      );
      final checkAuthListener = setUpListener(container, checkAuthProvider);
      final authListener = setUpListener(container, authStateProvider);

      // WHEN
      verifyOnly(
        checkAuthListener,
        () => checkAuthListener(null, loadingState),
      );

      verifyOnly(authListener, () => authListener(null, unauthenticatedState));

      final call = container.read(checkAuthProvider.future);

      // THEN
      await expectLater(call, completion(tUser));

      verifyInOrder([
        () => mockAuthRepo.getUserAuthUid(),
        () => mockAuthRepo.getUserData(tUser.id),
        () => authListener(unauthenticatedState, authenticatedState),
        () => checkAuthListener(loadingState, dataState),
      ]);
      verifyNoMoreInteractions(mockAuthRepo);
      verifyNoMoreInteractions(authListener);
      verifyNoMoreInteractions(checkAuthListener);
    },
  );

  test(
    'should emit AsyncError when AuthRepo.getUserAuthUid throws '
    'and call signOutProvider',
    () async {
      // GIVEN
      when(() => mockAuthRepo.getUserAuthUid()).thenAnswer(
        (_) => Error.throwWithStackTrace(tException, tStackTrace),
      );
      when(() => mockAuthRepo.signOut()).thenAnswer((_) async {});

      var calledSignOut = false;
      when(() => mockSignOutState.signOut()).thenAnswer((_) async {
        calledSignOut = true;
      });

      final container = setUpContainer(
        overrides: [
          authRepoProvider.overrideWithValue(mockAuthRepo),
          signOutStateProvider.overrideWith(() => mockSignOutState),
        ],
      );
      final checkAuthListener = setUpListener(container, checkAuthProvider);
      final authListener = setUpListener(container, authStateProvider);

      // WHEN
      verifyOnly(
        checkAuthListener,
        () => checkAuthListener(null, loadingState),
      );

      verifyOnly(authListener, () => authListener(null, unauthenticatedState));

      final call = container.read(checkAuthProvider.future);

      // THEN
      await expectLater(call, throwsA(tException));

      verifyInOrder([
        () => mockAuthRepo.getUserAuthUid(),
        () => checkAuthListener(loadingState, errorState),
      ]);
      verifyNoMoreInteractions(mockAuthRepo);
      verifyNoMoreInteractions(authListener);
      verifyNoMoreInteractions(checkAuthListener);

      expect(calledSignOut, true);
    },
  );

  test(
    'should emit AsyncError when AuthRepo.getUserData throws '
    'and call signOutProvider',
    () async {
      // GIVEN
      when(() => mockAuthRepo.getUserAuthUid()).thenAnswer((_) => Future.value(tUser.id));
      when(() => mockAuthRepo.getUserData(tUser.id)).thenAnswer(
        (_) => Error.throwWithStackTrace(tException, tStackTrace),
      );
      when(() => mockAuthRepo.signOut()).thenAnswer((_) async {});

      var calledSignOut = false;
      when(() => mockSignOutState.signOut()).thenAnswer((_) async {
        calledSignOut = true;
      });

      final container = setUpContainer(
        overrides: [
          authRepoProvider.overrideWithValue(mockAuthRepo),
          signOutStateProvider.overrideWith(() => mockSignOutState),
        ],
      );
      final checkAuthListener = setUpListener(container, checkAuthProvider);
      final authListener = setUpListener(container, authStateProvider);

      // WHEN
      verifyOnly(
        checkAuthListener,
        () => checkAuthListener(null, loadingState),
      );

      verifyOnly(authListener, () => authListener(null, unauthenticatedState));

      final call = container.read(checkAuthProvider.future);

      // THEN
      await expectLater(call, throwsA(tException));

      verifyInOrder([
        () => mockAuthRepo.getUserAuthUid(),
        () => mockAuthRepo.getUserData(tUser.id),
        () => checkAuthListener(loadingState, errorState),
      ]);
      verifyNoMoreInteractions(mockAuthRepo);
      verifyNoMoreInteractions(authListener);
      verifyNoMoreInteractions(checkAuthListener);

      expect(calledSignOut, true);
    },
  );
}
