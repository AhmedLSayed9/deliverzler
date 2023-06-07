// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/sign_in_with_email.dart';
import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_in_provider.dart';
import 'package:deliverzler/core/presentation/providers/provider_utils.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockSignInWithEmailEvent
    extends AutoDisposeNotifier<Option<Event<SignInWithEmail>>>
    with Mock
    implements SignInWithEmailEvent {}

void main() {
  late MockSignInWithEmailEvent mockSignInWithEmailEvent;
  late MockAuthRepo mockAuthRepo;
  late MockFirebaseMessaging mockFcm;

  setUp(() {
    mockSignInWithEmailEvent = MockSignInWithEmailEvent();
    mockAuthRepo = MockAuthRepo();
    mockFcm = MockFirebaseMessaging();
    registerFallbackValue(const AsyncLoading<Option<User>>());
  });

  const tParams = SignInWithEmail(email: 'tEmail', password: 'tPass');
  final tEvent = Event.unique(tParams);
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
    'signInStateProvider',
    () {
      const loadingState = AsyncLoading<Option<User>>();
      const idleState = AsyncData<Option<User>>(None());
      const successState = AsyncData<Option<User>>(Some(tUser));

      test(
        'should emit signInWithEmailProvider state when signInWithEmailEventProvider is some',
        () async {
          // GIVEN
          when(mockSignInWithEmailEvent.build).thenReturn(Some(tEvent));

          final container = setUpContainer(
            overrides: [
              signInWithEmailEventProvider
                  .overrideWith(() => mockSignInWithEmailEvent),
              signInProvider(tEvent).overrideWith((ref) => tUser),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);

          // WHEN
          final call = container.read(signInStateProvider.future);

          // THEN
          await expectLater(call, completion(const Some(tUser)));

          verifyInOrder([
            () => listener(null, loadingState),
            () => listener(loadingState, successState),
          ]);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit idleState when signInWithEmailEventProvider is none',
        () async {
          // GIVEN
          when(mockSignInWithEmailEvent.build).thenReturn(const None());

          final container = setUpContainer(
            overrides: [
              signInWithEmailEventProvider
                  .overrideWith(() => mockSignInWithEmailEvent),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);

          // WHEN
          await container.read(signInStateProvider.future);

          // THEN
          verifyOnly(listener, () => listener(null, idleState));
        },
      );

      test(
        'should authenticate user when next state is success (some)',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signInProvider(tEvent).overrideWith((ref) => tUser),
            ],
          );
          final authListener = setUpListener(container, authStateProvider);
          final signInStateListener =
              setUpListener(container, signInStateProvider);

          // WHEN
          verifyOnly(
              authListener, () => authListener(null, unauthenticatedState));

          verifyOnly(
              signInStateListener, () => signInStateListener(null, idleState));

          container
              .read(signInWithEmailEventProvider.notifier)
              .update((_) => Some(tEvent));
          await container.read(signInStateProvider.future);

          // THEN
          verifyInOrder([
            () =>
                signInStateListener(idleState, any(that: isA<AsyncLoading>())),
            () => authListener(unauthenticatedState, authenticatedState),
            () => signInStateListener(
                any(that: isA<AsyncLoading>()), successState),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(signInStateListener);
        },
      );
    },
  );

  group(
    'signInWithEmailEventProvider',
    () {
      test(
        'initial state should be none',
        () async {
          // GIVEN
          final container = setUpContainer();

          // THEN
          expect(container.read(signInWithEmailEventProvider), const None());
        },
      );
    },
  );

  group(
    'signInWithEmailProvider',
    () {
      const loadingState = AsyncLoading<User>();
      final errorState = AsyncError<User>(tException, tStackTrace);
      const dataState = AsyncData<User>(tUser);

      setUp(() {
        registerFallbackValue(const AsyncLoading<User>());
        registerFallbackValue(
            const SignInWithEmail(email: '', password: ''));
      });

      test(
        'should emit AsyncData(user) when AuthRepo.signInWithEmail, AuthRepo.getUserData'
        'and fcm.subscribeToTopic("general") return normally',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any()))
              .thenAnswer((_) => Future.value(tUser));
          when(() => mockAuthRepo.getUserData(any()))
              .thenAnswer((_) => Future.value(tUser));
          when(() => mockFcm.subscribeToTopic(any()))
              .thenAnswer((_) async {});

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              fcmProvider.overrideWith((ref) => mockFcm),
            ],
          );
          final listener = setUpListener(container, signInProvider(tEvent));

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(signInProvider(tEvent).future);

          // THEN
          await expectLater(call, completion(tUser));

          verifyInOrder([
            () => mockAuthRepo.signInWithEmail(tParams),
            () => mockAuthRepo.getUserData(tUser.id),
            () => mockFcm.subscribeToTopic('general'),
            () => listener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(mockFcm);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when AuthRepo.signInWithEmail throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any())).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
            ],
          );
          final listener = setUpListener(container, signInProvider(tEvent));

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(signInProvider(tEvent).future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockAuthRepo.signInWithEmail(tParams),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when AuthRepo.getUserData throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any()))
              .thenAnswer((_) => Future.value(tUser));
          when(() => mockAuthRepo.getUserData(any())).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
            ],
          );
          final listener = setUpListener(container, signInProvider(tEvent));

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(signInProvider(tEvent).future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockAuthRepo.signInWithEmail(tParams),
            () => mockAuthRepo.getUserData(tUser.id),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
