import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../data/models/app_notification_model.dart';
import '../../domain/entities/app_notification.dart';
import 'fcm_remote_message_providers.dart';

part 'tapped_notification_provider.g.dart';

@riverpod
class TappedNotification extends _$TappedNotification with NotifierUpdate {
  @override
  Option<AppNotification> build() {
    ref.listen(getInitialMessageProvider, (previous, next) {
      next.whenData((message) {
        if (message is Some<RemoteMessage> && message.value.data.isNotEmpty) {
          final ntf =
              AppNotificationModel.fromJson(message.value.data).toEntity();
          state = Some(ntf);
        }
      });
    });

    ref.listen(onMessageOpenedAppProvider, (previous, next) {
      next.whenData(
        (message) {
          if (message.data.isNotEmpty) {
            final ntf = AppNotificationModel.fromJson(message.data).toEntity();
            state = Some(ntf);
          }
        },
      );
    });

    return const None();
  }
}
