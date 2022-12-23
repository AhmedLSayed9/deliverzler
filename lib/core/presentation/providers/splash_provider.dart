import 'dart:async';

import 'package:deliverzler/auth/domain/use_cases/check_auth_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/core/data/network/network_info.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final splashProvider = FutureProvider.autoDispose<String>((ref) async {
  await Future.delayed(const Duration(milliseconds: 1000)); //Min Time of splash
  final hasConnection =
      await ref.watch(networkInfoProvider).hasInternetConnection;
  if (hasConnection) {
    return ref.watch(checkAuthProvider.future);
  } else {
    return RoutePaths.coreNoInternet;
  }
});

final checkAuthProvider = FutureProvider.autoDispose<String>((ref) async {
  try {
    final user = await ref.watch(checkAuthUCProvider).call();
    ref.watch(authStateProvider.notifier).authenticateUser(user);
  } catch (_) {}
  return RoutePaths.authGuard;
});
