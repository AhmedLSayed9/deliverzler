import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/notifications/data/models/app_notification_model.dart';
import '../../../../features/notifications/presentation/providers/tapped_notification_provider.dart';
import '../../utils/functional.dart';

part 'flutter_local_notifications_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterLocalNotificationsPlugin flutterLocalNotifications(
    FlutterLocalNotificationsRef ref) {
  final flutterLocalNotifications = ref.watch(
    setupFlutterLocalNotificationsProvider.select((value) => value.valueOrNull),
  );
  return flutterLocalNotifications ??
      (throw Exception(
          'setupFlutterLocalNotificationsProvider has not initialized'));
}

@Riverpod(keepAlive: true)
Future<FlutterLocalNotificationsPlugin> setupFlutterLocalNotifications(
    SetupFlutterLocalNotificationsRef ref) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('notification_icon');
  const IOSInitializationSettings iosSettings = IOSInitializationSettings(
    requestAlertPermission: true,
    requestSoundPermission: true,
    requestBadgePermission: false,
  );

  const InitializationSettings settings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onSelectNotification: (payload) {
      if (payload != null) {
        final Map<String, dynamic> decodedPayload = jsonDecode(payload);
        if (decodedPayload.isNotEmpty) {
          final notification = AppNotificationModel.fromJson(decodedPayload);
          ref.read(tappedNotificationProvider.notifier).state =
              Some(notification.toEntity());
        }
      }
    },
  );
  return flutterLocalNotificationsPlugin;
}
