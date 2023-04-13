import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../auth/domain/use_cases/check_auth_uc.dart';
import '../../../auth/presentation/providers/auth_state_provider.dart';
import '../../core_features/locale/presentation/providers/app_locale_provider.dart';
import '../../core_features/theme/presentation/providers/app_theme_provider.dart';
import '../../data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import '../../data/network/network_info.dart';
import '../routing/route_paths.dart';
import '../services/fcm_service/fcm_provider.dart';
import '../services/local_notfication_service/flutter_local_notifications_provider.dart';
import '../utils/riverpod_framework.dart';

part 'splash_providers.g.dart';

@riverpod
Future<void> splashServicesWarmup(SplashServicesWarmupRef ref) async {
  await ref.watch(sharedPrefsAsyncProvider.future);
  final min = Future.delayed(const Duration(seconds: 1)); //Min Time of splash
  final s1 = ref.watch(appThemeControllerProvider.future);
  final s2 = ref.watch(appLocaleControllerProvider.future);
  final s3 = Future<void>(() async {
    if (!kIsWeb) {
      await ref.watch(setupFlutterLocalNotificationsProvider.future);
      await ref.watch(setupFCMProvider.future);
    }
  });
  await Future.wait([min, s1, s2, s3]);
}

@riverpod
Future<String> splashTarget(SplashTargetRef ref) async {
  final hasConnection =
      await ref.watch(networkInfoProvider).hasInternetConnection;
  if (hasConnection) {
    return ref.watch(checkAuthProvider.future);
  } else {
    return RoutePaths.coreNoInternet;
  }
}

@riverpod
Future<String> checkAuth(CheckAuthRef ref) async {
  //TODO: avoid calling side-effect inside provider initialization.
  try {
    final user = await ref.watch(checkAuthUCProvider).call();
    ref.watch(authStateProvider.notifier).authenticateUser(user);
  } catch (_) {}
  return RoutePaths.authGuard;
}
