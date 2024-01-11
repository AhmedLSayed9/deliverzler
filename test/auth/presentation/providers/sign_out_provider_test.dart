// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:deliverzler/core/infrastructure/notification/notification_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class MockNotificationService extends Mock implements NotificationService {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late MockNotificationService mockNotificationService;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockNotificationService = MockNotificationService();
    registerFallbackValue(const AsyncLoading<Option<Unit>>());
  });

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

  T loadingState<T>() => any(that: isA<AsyncLoading<Option<Unit>>>());
  const idleState = AsyncData<Option<Unit>>(None());
  const successState = AsyncData<Option<Unit>>(Some(unit));

  group(
    'build',
    () {
      test(
        'initial state should be idleState',
        () async {
          // GIVEN
          final container = setUpContainer();

          // THEN
          expect(container.read(signOutStateProvider), idleState);
        },
      );
    },
  );

  group(
    'signOut',
    () {
      test(
        'should unawaited-call AuthRepo.signOut and fcm.unsubscribeFromTopic("general") '
        'then unAuthenticate user and emit successState',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signOut()).thenAnswer((_) async {});
          when(() => mockNotificationService.unsubscribeFromTopic(any())).thenAnswer((_) async {});

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              notificationServiceProvider.overrideWith((ref) => mockNotificationService),
            ],
          );
          final listener = setUpListener(container, signOutStateProvider);

          container.read(authStateProvider.notifier).authenticateUser(tUser);
          final authListener = setUpListener(container, authStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));

          verifyOnly(authListener, () => authListener(null, authenticatedState));

          final call = container.read(signOutStateProvider.notifier).signOut();

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => mockAuthRepo.signOut(),
            () => mockNotificationService.unsubscribeFromTopic('general'),
            () => authListener(authenticatedState, unauthenticatedState),
            () => listener(loadingState(), successState),
          ]);
          verifyNoMoreInteractions(mockAuthRepo);
          verifyNoMoreInteractions(mockNotificationService);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );

      test(
        'should suppress AuthRepo.signOut and fcm.unsubscribeFromTopic("general") errors',
        () async {
          // GIVEN
          when(() => mockAuthRepo.signOut()).thenAnswer(
            (_) async => Error.throwWithStackTrace(tException, tStackTrace),
          );
          when(() => mockNotificationService.unsubscribeFromTopic(any())).thenAnswer(
            (_) async => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              authRepoProvider.overrideWith((ref) => mockAuthRepo),
              notificationServiceProvider.overrideWith((ref) => mockNotificationService),
            ],
          );
          final listener = setUpListener(container, signOutStateProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, idleState));

          final call = container.read(signOutStateProvider.notifier).signOut();

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => listener(idleState, loadingState()),
            () => listener(loadingState(), successState),
          ]);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}
