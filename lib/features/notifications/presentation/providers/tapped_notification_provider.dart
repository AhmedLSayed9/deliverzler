import 'package:deliverzler/features/notifications/domain/entities/app_notification.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tappedNotificationProvider =
    StateProvider<Option<AppNotification>>((ref) {
  return const None();
});
