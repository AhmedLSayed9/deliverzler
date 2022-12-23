import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/presentation/services/local_notfication_service/flutter_local_notifications_provider.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/app_notification.dart';
import '../../infrastructure/dtos/app_notification_dto.dart';
import 'fcm_remote_message_providers.dart';

part 'tapped_notification_provider.g.dart';

@riverpod
Option<AppNotification> tappedNotification(TappedNotificationRef ref) {
  ref.listen(getInitialMessageProvider, (previous, next) {
    next.whenData((message) {
      if (message is Some<RemoteMessage> && message.value.data.isNotEmpty) {
        final ntf =
            AppNotificationDto.fromJson(message.value.data).toDomain();
        ref.state = Some(ntf);
      }
    });
  });

  ref.listen(onMessageOpenedAppProvider, (previous, next) {
    next.whenData(
      (message) {
        if (message.data.isNotEmpty) {
          final ntf = AppNotificationDto.fromJson(message.data).toDomain();
          ref.state = Some(ntf);
        }
      },
    );
  });

  ref.listen(onSelectNotificationProvider, (previous, next) {
    if (next is Some<AppNotification>) {
      ref.state = next;
    }
  });

  return const None();
}
