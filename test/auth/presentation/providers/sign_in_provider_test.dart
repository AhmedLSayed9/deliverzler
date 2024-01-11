// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:deliverzler/core/infrastructure/notification/notification_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/sign_in_with_email.dart';
import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_in_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockNotificationService extends Mock implements NotificationService {}

class MockSignInState extends AutoDisposeAsyncNotifier<Option<User>>
    with Mock
    implements SignInState {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late MockNotificationService mockNotificationService;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockNotificationService = MockNotificationService();
    registerFallbackValue(const AsyncLoading<Option<User>>());
    registerFallbackValue(const SignInWithEmail(email: '', password: ''));
  });

  const tParams = SignInWithEmail(email: 'tEmail', password: 'tPass');
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

  T loadingState<T>() => any(that: isA<AsyncLoading<Option<User>>>());
  const idleState = AsyncData<Option<User>>(None());
  T errorState<T>() => any(
        that: isA<AsyncError<Option<User>>>().having((e) => e.error, 'error', equals(tException)),
      );
  const successState = AsyncData<Option<User>>(Some(tUser));

  group(
    'build',
    () {
      test(
        'initial state should be idleState',
        () async {
          // GIVEN
          final container = setUpContainer();

          // THEN
          expect(container.read(signInStateProvider), idleState);
        },
      );
    },
  );

  group(
    'signIn',
    () {
      test(
        'should authenticate user and emit successState '
        'when AuthRepo.signInWithEmail, AuthRepo.getUserData and fcm.subscribeToTopic("general") return normally',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any())).thenAnswer((_) => Future.value(tUser));
          when(() => mockAuthRepo.getUserData(any())).thenAnswer((_) => Future.value(tUser));
          when(() => mockNotificationService.subscribeToTopic(any())).thenAnswer((_) async {});

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              notificationServiceProvider.overrideWith((ref) => mockNotificationService),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));

          verifyOnly(authListener, () => authListener(null, unauthenticatedState));

          final call = container.read(signInStateProvider.notifier).signIn(tParams);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => mockAuthRepo.signInWithEmail(tParams),
            () => mockAuthRepo.getUserData(tUser.id),
            () => mockNotificationService.subscribeToTopic('general'),
            () => authListener(unauthenticatedState, authenticatedState),
            () => listener(loadingState(), successState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(mockNotificationService);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );

      test(
        'should not authenticate user and should emit errorState '
        'when AuthRepo.signInWithEmail throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any())).thenThrow(tException);

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));
          verifyOnly(authListener, () => authListener(null, unauthenticatedState));

          final call = container.read(signInStateProvider.notifier).signIn(tParams);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => mockAuthRepo.signInWithEmail(tParams),
            () => listener(loadingState(), errorState()),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );

      test(
        'should not authenticate user and should emit errorState '
        'when AuthRepo.getUserData throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any())).thenAnswer((_) => Future.value(tUser));
          when(() => mockAuthRepo.getUserData(any())).thenThrow(tException);

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));
          verifyOnly(authListener, () => authListener(null, unauthenticatedState));

          final call = container.read(signInStateProvider.notifier).signIn(tParams);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => mockAuthRepo.signInWithEmail(tParams),
            () => mockAuthRepo.getUserData(tUser.id),
            () => listener(loadingState(), errorState()),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );

      test(
        'should not authenticate user and should emit errorState '
        'when fcm.subscribeToTopic("general") throws',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signInWithEmail(any())).thenAnswer((_) => Future.value(tUser));
          when(() => mockAuthRepo.getUserData(any())).thenAnswer((_) => Future.value(tUser));
          when(() => mockNotificationService.subscribeToTopic(any())).thenThrow(tException);

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              notificationServiceProvider.overrideWith((ref) => mockNotificationService),
            ],
          );
          final listener = setUpListener(container, signInStateProvider);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));
          verifyOnly(authListener, () => authListener(null, unauthenticatedState));

          final call = container.read(signInStateProvider.notifier).signIn(tParams);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => mockAuthRepo.signInWithEmail(tParams),
            () => mockAuthRepo.getUserData(tUser.id),
            () => mockNotificationService.subscribeToTopic('general'),
            () => listener(loadingState(), errorState()),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(mockNotificationService);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );
}
