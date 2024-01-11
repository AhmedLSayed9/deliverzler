import 'package:firebase_messaging/firebase_messaging.dart';

import 'notification_service.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

part 'fcm_remote_message_providers.g.dart';

/*
/// When using `Notification message`, The default behavior on all platforms is to automatically display a notification
/// by FCM when the app is in background/terminated. This behavior can't be disabled [https://stackoverflow.com/questions/71028036]
/// Only on android, you can update FCM to use our own channel rather than the default FCM one by
/// overriding the default FCM channel with our custom notification channel (i.e: flutterLocalNotifications)
/// as done in [_setupAndroidHeadsUp].
///
/// To disable FCM auto handling background/terminated notifications, you've to use `Data message` instead.
/// More details: https://firebase.google.com/docs/cloud-messaging/concept-options#notifications_and_data_messages
/// Note: You should not rely on data only messages to be delivered. They should only be used to
/// support your application's non-critical functionality [https://firebase.flutter.dev/docs/messaging/usage#low-priority-messages]
///
/// If the application is in the foreground, the Firebase SDK will block displaying any FCM notification
/// for android/iOS no matter what Notification Channel has been set. We can however still handle incoming notifications
/// via the onMessage stream and display a custom local notification using flutter_local_notifications.
/// Note: FCM can handle foreground for iOS by using `setForegroundNotificationPresentationOptions` but if you
/// want to use custom notification instead then avoid using it (or disable alert) as done in [_setupIOSHeadsUp].
///
/// Using custom notification display for iOS in foreground is necessary to be able to
/// handle notification interaction using `onDidReceiveNotificationResponse` from flutter_local_notifications
/// while `onMessageOpenedApp` is used to handle background notification interaction.
/// & [getInitialMessage] is used to handle terminated notification interaction.
/// More details: https://firebase.flutter.dev/docs/messaging/notifications/#handling-interaction
*/

/// Called when the application open from a terminated state.
/// If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
/// Should be called in app initState or at home screen because we need context for navigation.
@riverpod
Future<Option<RemoteMessage>> getInitialMessage(GetInitialMessageRef ref) async {
  final notificationService = ref.watch(notificationServiceProvider);
  final initialMsg = await notificationService.getInitialMessage();
  return Option.fromNullable(initialMsg);
}

/// Called when FCM payload is received while the app is in the foreground.
@riverpod
Stream<RemoteMessage> onMessage(OnMessageRef ref) {
  return FirebaseMessaging.onMessage;
}

/// Called when a user presses a notification message displayed via FCM.
/// Only if the app has opened from background state (not foreground or terminated).
@riverpod
Stream<RemoteMessage> onMessageOpenedApp(OnMessageOpenedAppRef ref) {
  return FirebaseMessaging.onMessageOpenedApp;
}
