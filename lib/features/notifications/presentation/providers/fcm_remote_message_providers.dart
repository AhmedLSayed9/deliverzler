import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/show_fcm_notification_provider.dart';
import 'package:deliverzler/features/notifications/data/models/app_notification_model.dart';
import 'package:deliverzler/features/notifications/presentation/providers/tapped_notification_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_remote_message_providers.g.dart';

@riverpod
Future<void> getInitialMessage(GetInitialMessageRef ref) async {
  // Called when the application open from a terminated state.
  // If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
  // Should be called in app initState or at home screen because we need context for navigation.
  final fcm = ref.watch(fcmProvider);
  return fcm.getInitialMessage().then((message) {
    if (message != null && message.data.isNotEmpty) {
      ref.read(tappedNotificationProvider.notifier).state =
          Some(AppNotificationModel.fromJson(message.data).toEntity());
    }
  });
}

final onMessageProvider = StreamProvider.autoDispose<RemoteMessage>((ref) {
  // Called when FCM payload is received while the app is in the foreground.
  ref.listenSelf((previous, next) {
    next.whenData(
      (message) {
        ref.read(showFCMNotificationProvider(message));
      },
    );
  });
  return FirebaseMessaging.onMessage;
});

final onMessageOpenedAppProvider =
    StreamProvider.autoDispose<RemoteMessage>((ref) {
  // Called when a user presses a notification message displayed via FCM.
  // Only if the app has opened from background state (not foreground or terminated).
  ref.listenSelf((previous, next) {
    next.whenData(
      (message) {
        if (message.data.isNotEmpty) {
          ref.read(tappedNotificationProvider.notifier).state =
              Some(AppNotificationModel.fromJson(message.data).toEntity());
        }
      },
    );
  });
  return FirebaseMessaging.onMessageOpenedApp;
});
