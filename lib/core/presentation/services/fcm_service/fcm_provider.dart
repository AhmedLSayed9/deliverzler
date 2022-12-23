import 'package:deliverzler/core/presentation/services/local_notfication_service/flutter_local_notifications_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fcmProvider = Provider<FirebaseMessaging>((ref) {
  return FirebaseMessaging.instance;
});

const AndroidNotificationChannel fcmChannel = AndroidNotificationChannel(
  'firebase_push_notification',
  'Deliverzler Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

final setupFCMProvider = FutureProvider.autoDispose<void>(
  (ref) async {
    final permission = await ref.watch(_grantFCMPermissionProvider.future);
    if (permission != AuthorizationStatus.authorized) {
      return;
    }

    await ref.watch(_setupAndroidHeadsUpProvider.future);
    await ref.watch(_setupIOSHeadsUpProvider.future);
  },
);

final _grantFCMPermissionProvider =
    FutureProvider.autoDispose<AuthorizationStatus>((ref) async {
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
});

final _setupAndroidHeadsUpProvider =
    FutureProvider.autoDispose<void>((ref) async {
  // Create an Android Notification Channel.
  // We use this channel in the `AndroidManifest.xml` file to override the
  // default FCM channel to enable heads up notifications.
  final notificationService = ref.watch(flutterLocalNotificationsProvider);
  return await notificationService
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(fcmChannel);
});

final _setupIOSHeadsUpProvider = FutureProvider.autoDispose<void>((ref) async {
  // Update the iOS foreground notification presentation options to allow
  // heads up notifications.
  // Disable alert if you're using flutterLocalNotification to handle foreground
  // notifications instead of FCM, otherwise, you'll get duplicated heads up notification.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: false,
    sound: true,
    badge: true,
  );
});
