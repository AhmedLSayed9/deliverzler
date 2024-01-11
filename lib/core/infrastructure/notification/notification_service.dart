import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../../presentation/helpers/platform_helper.dart';
import '../../presentation/providers/provider_utils.dart';
import '../../presentation/utils/fp_framework.dart';
import '../../presentation/utils/riverpod_framework.dart';
import 'notification.dart';

part 'notification_service.g.dart';

const AndroidNotificationChannel _channel = AndroidNotificationChannel(
  'high_importance_channel',
  'Deliverzler High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.max,
);

final _notificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    _channel.id,
    _channel.name,
    channelDescription: _channel.description,
    importance: _channel.importance,
    priority: Priority.high,
    color: AppStaticColors.primary,
    enableLights: true,
  ),
  iOS: const DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  ),
);

@riverpod
Future<void> setupFlutterNotifications(SetupFlutterNotificationsRef ref) async {
  final notificationService = ref.watch(notificationServiceProvider);
  await notificationService._setupFlutterNotifications();
}

@riverpod
Future<AuthorizationStatus> requestNotificationPermissions(
  RequestNotificationPermissionsRef ref,
) async {
  final notificationService = ref.watch(notificationServiceProvider);
  return notificationService._requestPermissions();
}

@Riverpod(keepAlive: true)
NotificationService notificationService(NotificationServiceRef ref) => NotificationService(
      ref,
      FlutterLocalNotificationsPlugin(),
      FirebaseMessaging.instance,
    );

class NotificationService {
  const NotificationService(
    this.ref,
    this._flutterLocalNotifications,
    this._fcm,
  );

  final NotificationServiceRef ref;
  final FlutterLocalNotificationsPlugin _flutterLocalNotifications;
  final FirebaseMessaging _fcm;

  static const _androidIcon = 'notification_icon';

  Future<void> _setupFlutterNotifications() async {
    if (kIsWeb) return;
    await _initializeLocalNotifications();
    if (PlatformHelper.isMaterialApp) {
      await _setupAndroidHeadsUp();
    } else {
      await _setupIOSHeadsUp();
    }
  }

  Future<void> _initializeLocalNotifications() async {
    // Android setting
    // androidIcon needs to be a added as a drawable resource to the Android head project.
    const androidSettings = AndroidInitializationSettings(_androidIcon);
    // iOS & macOS setting
    const darwinSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(android: androidSettings, iOS: darwinSettings);

    await _flutterLocalNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        ref.read(notificationResponseEventProvider.notifier).update(
              (_) => Some(notificationResponse),
            );
      },
    );
  }

  /// Create an Android Notification Channel.
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  Future<void> _setupAndroidHeadsUp() async {
    return await _flutterLocalNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  /// Update the iOS foreground notification presentation options to allow heads up notifications.
  /// Disable alert if you're using flutterLocalNotification to handle foreground notifications
  /// instead of FCM, otherwise, you'll get duplicated heads up notification.
  Future<void> _setupIOSHeadsUp() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      sound: true,
      badge: true,
    );
  }

  Future<AuthorizationStatus> _requestPermissions() async {
    /* //Add when adding integration tests.
    if (isIntegrationTest) {
      // Firebase Messaging is not available in integration tests.
      log('Skipping to request Firebase Messaging access because integration test is running.');
      return AuthorizationStatus.denied;
    } */

    // Currently, we are not able to set up Firebase Messaging on web because of
    // https://github.com/firebase/flutterfire/issues/10870.
    if (kIsWeb) return AuthorizationStatus.denied;

    // On iOS, macOS & web, before FCM payloads can be received on your device
    // you must first ask the user's permission.
    // Older Androids are not required to request permission.
    final settings = await _fcm.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
    return settings.authorizationStatus;
  }

  Future<void> showRemoteNotification(RemoteMessage message) async {
    final notification = message.notification;
    final messageData = message.data;

    if (notification != null && !kIsWeb) {
      await _flutterLocalNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _notificationDetails,
        payload: jsonEncode(messageData),
      );
    }
  }

  Future<void> showLocalNotification({
    required String title,
    required String body,
    NotificationPayload? payload,
  }) async {
    return _flutterLocalNotifications.show(
      0,
      title,
      body,
      _notificationDetails,
      payload: payload != null ? jsonEncode(payload.toJson()) : null,
    );
  }

  Future<RemoteMessage?> getInitialMessage() => _fcm.getInitialMessage();

  Future<void> subscribeToTopic(String topic) => _fcm.subscribeToTopic(topic);

  Future<void> unsubscribeFromTopic(String topic) => _fcm.unsubscribeFromTopic(topic);
}

@Riverpod(keepAlive: true)
class NotificationResponseEvent extends _$NotificationResponseEvent with NotifierUpdate {
  @override
  Option<NotificationResponse> build() => const None();
}
