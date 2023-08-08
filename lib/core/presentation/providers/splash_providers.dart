import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../auth/presentation/providers/check_auth_provider.dart';
import '../../core_features/locale/presentation/providers/app_locale_provider.dart';
import '../../core_features/theme/presentation/providers/app_theme_provider.dart';
import '../../infrastructure/local/shared_preferences_facade.dart';
import '../../infrastructure/network/network_info.dart';
import '../extensions/future_extensions.dart';
import '../routing/app_router.dart';
import '../services/fcm_service/fcm_provider.dart';
import '../services/local_notfication_service/flutter_local_notifications_provider.dart';
import '../utils/riverpod_framework.dart';

part 'splash_providers.g.dart';

@riverpod
Future<void> splashServicesWarmup(SplashServicesWarmupRef ref) async {
  await ref.watch(sharedPrefsAsyncProvider.future);
  final min = Future<void>.delayed(const Duration(seconds: 1)); //Min Time of splash
  final s1 = ref.watch(appThemeControllerProvider.future);
  final s2 = ref.watch(appLocaleControllerProvider.future);
  final s3 = Future<void>(() async {
    if (!kIsWeb) {
      await ref.watch(setupFlutterLocalNotificationsProvider.future);
      await ref.watch(setupFCMProvider.future);
    }
  });
  final s4 = ref.watch(checkAuthProvider.future);
  await [min, s1, s2, s3, s4].wait.throwAllErrors();
}

@riverpod
Future<String> splashTarget(SplashTargetRef ref) async {
  final hasConnection = await ref.watch(networkInfoProvider).hasInternetConnection;
  if (hasConnection) {
    return const SignInRoute().location;
  } else {
    return const NoInternetRoute().location;
  }
}
