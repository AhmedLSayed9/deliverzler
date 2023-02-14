import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/use_cases/check_auth_uc.dart';
import '../../../auth/presentation/providers/auth_state_provider.dart';
import '../../data/network/network_info.dart';
import '../routing/route_paths.dart';

part 'splash_provider.g.dart';

@riverpod
Future<String> splash(SplashRef ref) async {
  await Future.delayed(const Duration(milliseconds: 1000)); //Min Time of splash
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
  try {
    final user = await ref.watch(checkAuthUCProvider).call();
    ref.watch(authStateControllerProvider.notifier).authenticateUser(user);
  } catch (_) {}
  return RoutePaths.authGuard;
}
