import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../local_notfication_service/flutter_local_notifications_provider.dart';

part 'fcm_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseMessaging fcm(FcmRef ref) {
  return FirebaseMessaging.instance;
}

const AndroidNotificationChannel fcmChannel = AndroidNotificationChannel(
  'firebase_push_notification',
  'Deliverzler Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

@riverpod
Future<void> setupFCM(SetupFCMRef ref) async {
  final permission = await ref.watch(_grantFCMPermissionProvider.future);
  if (permission != AuthorizationStatus.authorized) {
    return;
  }

  await ref.watch(_setupAndroidHeadsUpProvider.future);
  await ref.watch(_setupIOSHeadsUpProvider.future);
}

@riverpod
Future<AuthorizationStatus> _grantFCMPermission(
    _GrantFCMPermissionRef ref) async {
  // On iOS, macOS & web, before FCM payloads can be received on your device
  // you must first ask the user's permission.
  // Android applications are not required to request permission.
  final settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );
  return settings.authorizationStatus;
}

@riverpod
Future<void> _setupAndroidHeadsUp(_SetupAndroidHeadsUpRef ref) async {
  // Create an Android Notification Channel.
  // We use this channel in the `AndroidManifest.xml` file to override the
  // default FCM channel to enable heads up notifications.
  final notificationService = ref.watch(flutterLocalNotificationsProvider);
  return await notificationService
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(fcmChannel);
}

@riverpod
Future<void> _setupIOSHeadsUp(_SetupIOSHeadsUpRef ref) async {
  // Update the iOS foreground notification presentation options to allow
  // heads up notifications.
  // Disable alert if you're using flutterLocalNotification to handle foreground
  // notifications instead of FCM, otherwise, you'll get duplicated heads up notification.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: false,
    sound: true,
    badge: true,
  );
}
