import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../../utils/riverpod_framework.dart';
import '../local_notfication_service/flutter_local_notifications_provider.dart';
import 'fcm_provider.dart';

part 'show_fcm_notification_provider.g.dart';

// When using `Notification message`, The default behavior on all platforms is to automatically display a notification
// by FCM when the app is in background/terminated. This behavior can't be disabled [https://stackoverflow.com/questions/71028036]
// Only on android, you can update FCM to use our own channel rather than the default FCM one by
// overriding the default FCM channel with our custom notification channel (i.e: flutterLocalNotifications)
// as done in [setupAndroidHeadsUpProvider].
// To disable FCM auto handling background/terminated notifications, you've to use `Data message` instead.
// More details: https://firebase.google.com/docs/cloud-messaging/concept-options#notifications_and_data_messages
//
// If your own application is in the foreground, the Firebase Android SDK will block displaying any FCM notification
// for android/iOS no matter what Notification Channel has been set. We can however still handle incoming notifications
// via the onMessage stream and display a custom local notification using flutter_local_notifications.
// Note: FCM can handle foreground for iOS by using [setForegroundNotificationPresentationOptions] but if you
// want to use custom notification instead then avoid using it (or disable alert) as done in [setupIOSHeadsUpProvider].
//
// Using custom notification display for iOS in foreground is necessary to be able to
// handle notification interaction using [OnSelectNotification] from flutter_local_notifications
// while [onMessageOpenedApp] is used to handle background notification interaction.
// & [getInitialMessage] is used to handle terminated notification interaction.
// More details: https://firebase.flutter.dev/docs/messaging/notifications/#handling-interaction

@riverpod
Future<void> showFCMNotification(
  ShowFCMNotificationRef ref,
  RemoteMessage message,
) async {
  final notification = message.notification;
  final messageData = message.data;

  if (notification != null && !kIsWeb) {
    final notificationService = ref.watch(flutterLocalNotificationsProvider);
    await notificationService.show(
      notification.hashCode,
      notification.title,
      notification.body,
      fcmNotificationDetails,
      payload: jsonEncode(messageData),
    );
  }
}

final fcmNotificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    fcmChannel.id,
    fcmChannel.name,
    channelDescription: fcmChannel.description,
    importance: fcmChannel.importance,
    priority: Priority.high,
    color: AppStaticColors.primary,
    enableLights: true,
  ),
  iOS: const IOSNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  ),
);
