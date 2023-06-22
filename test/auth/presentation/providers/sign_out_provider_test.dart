// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';
import 'package:deliverzler/core/presentation/providers/provider_utils.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockSignOutEvent extends AutoDisposeNotifier<Option<Event<Unit>>>
    with Mock
    implements SignOutEvent {}

void main() {
  late MockSignOutEvent mockSignOutEvent;
  late MockAuthRepo mockAuthRepo;
  late MockFirebaseMessaging mockFcm;

  setUp(() {
    mockSignOutEvent = MockSignOutEvent();
    mockAuthRepo = MockAuthRepo();
    mockFcm = MockFirebaseMessaging();
    registerFallbackValue(const AsyncLoading<SignOutState>());
  });

  final tEvent = Event.unique(unit);
  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  const authenticatedState = Some<User>(tUser);
  const unauthenticatedState = None();

  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  group(
    'signOutStateProvider',
    () {
      const loadingState = AsyncLoading<SignOutState>();
      const idleState = AsyncData<SignOutState>(SignOutState.idle);
      final errorState = AsyncError<SignOutState>(tException, tStackTrace);
      const successState = AsyncData<SignOutState>(SignOutState.success);

      test(
        'should emit signOutProvider state when signOutEventProvider is some',
        () async {
          // GIVEN
          when(mockSignOutEvent.build).thenReturn(Some(tEvent));

          final container = setUpContainer(
            overrides: [
              signOutEventProvider.overrideWith(() => mockSignOutEvent),
              signOutProvider(tEvent).overrideWith(
                (ref) => Error.throwWithStackTrace(tException, tStackTrace),
              ),
            ],
          );
          final listener = setUpListener(container, signOutStateProvider);

          // WHEN
          final call = container.read(signOutStateProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => listener(null, loadingState),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncData(SignOutState.idle) when signOutEventProvider is none',
        () async {
          // GIVEN
          when(mockSignOutEvent.build).thenReturn(const None());

          final container = setUpContainer(
            overrides: [
              signOutEventProvider.overrideWith(() => mockSignOutEvent),
            ],
          );
          final listener = setUpListener(container, signOutStateProvider);

          // WHEN
          await container.read(signOutStateProvider.future);

          // THEN
          verifyOnly(listener, () => listener(null, idleState));
        },
      );

      test(
        'should unAuthenticate user when next state is SignOutState.success',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signOutProvider(tEvent).overrideWith((ref) => unit),
            ],
          );
          final signOutStateListener = setUpListener(container, signOutStateProvider);
          container.read(authStateProvider.notifier).authenticateUser(tUser);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(
            signOutStateListener,
            () => signOutStateListener(null, idleState),
          );

          verifyOnly(
            authListener,
            () => authListener(null, authenticatedState),
          );

          container.read(signOutEventProvider.notifier).update((_) => Some(tEvent));
          await container.read(signOutStateProvider.future);

          // THEN
          verifyInOrder([
            () => signOutStateListener(idleState, any(that: isA<AsyncLoading<SignOutState>>())),
            () => authListener(authenticatedState, unauthenticatedState),
            () => signOutStateListener(
                  any(that: isA<AsyncLoading<SignOutState>>()),
                  successState,
                ),
          ]);
          verifyNoMoreInteractions(signOutStateListener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );

  group(
    'signOutEventProvider',
    () {
      test(
        'initial state should be none',
        () async {
          // GIVEN
          final container = setUpContainer();

          // THEN
          expect(container.read(signOutEventProvider), const None());
        },
      );
    },
  );

  group(
    'signOutProvider',
    () {
      const loadingState = AsyncLoading<void>();
      final errorState = AsyncError<void>(tException, tStackTrace);
      const dataState = AsyncData<void>(null);

      test(
        'should emit AsyncData(void) when AuthRepo.signOut '
        'and fcm.unsubscribeFromTopic("general") return normally',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signOut()).thenAnswer((_) async {});
          when(() => mockFcm.unsubscribeFromTopic(any())).thenAnswer((_) async {});

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              fcmProvider.overrideWith((ref) => mockFcm),
            ],
          );
          final listener = setUpListener(container, signOutProvider(tEvent));

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(signOutProvider(tEvent).future);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => mockAuthRepo.signOut(),
            () => mockFcm.unsubscribeFromTopic('general'),
            () => listener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(mockFcm);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when AuthRepo.signOut throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signOut()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
            ],
          );
          final signOutListener = setUpListener(container, signOutProvider(tEvent));
          container.read(authStateProvider.notifier).authenticateUser(tUser);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(
            signOutListener,
            () => signOutListener(null, loadingState),
          );

          verifyOnly(
            authListener,
            () => authListener(null, authenticatedState),
          );

          final call = container.read(signOutProvider(tEvent).future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockAuthRepo.signOut(),
            () => signOutListener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(signOutListener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );
}
