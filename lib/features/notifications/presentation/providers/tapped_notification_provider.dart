import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/presentation/services/local_notfication_service/flutter_local_notifications_provider.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/models/app_notification_model.dart';
import '../../domain/entities/app_notification.dart';
import 'fcm_remote_message_providers.dart';

part 'tapped_notification_provider.g.dart';

@riverpod
Option<AppNotification> tappedNotification(TappedNotificationRef ref) {
  ref.listen(getInitialMessageProvider, (previous, next) {
    next.whenData((message) {
      if (message is Some<RemoteMessage> && message.value.data.isNotEmpty) {
        final ntf =
            AppNotificationModel.fromJson(message.value.data).toEntity();
        ref.state = Some(ntf);
      }
    });
  });

  ref.listen(onMessageOpenedAppProvider, (previous, next) {
    next.whenData(
      (message) {
        if (message.data.isNotEmpty) {
          final ntf = AppNotificationModel.fromJson(message.data).toEntity();
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
