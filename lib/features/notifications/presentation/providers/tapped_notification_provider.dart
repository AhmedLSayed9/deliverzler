import 'package:deliverzler/features/notifications/domain/entities/app_notification.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tappedNotificationProvider =
    StateProvider<Option<AppNotification>>((ref) {
  return const None();
});
