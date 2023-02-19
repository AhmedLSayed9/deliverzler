import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/notifications/data/models/app_notification_model.dart';
import '../../../../features/notifications/presentation/providers/tapped_notification_provider.dart';
import '../../utils/functional.dart';

part 'flutter_local_notifications_provider.g.dart';

@riverpod
FlutterLocalNotificationsPlugin flutterLocalNotifications(
    FlutterLocalNotificationsRef ref) {
  final flutterLocalNotifications = ref.watch(
    setupFlutterLocalNotificationsProvider.select((value) => value.valueOrNull),
  );

  if (flutterLocalNotifications != null) {
    ref.keepAlive();
    return flutterLocalNotifications;
  } else {
    throw Exception(
        'setupFlutterLocalNotificationsProvider has not initialized');
  }
}

@riverpod
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

  final sub = ref.listen(tappedNotificationProvider.notifier, (prev, next) {});
  await flutterLocalNotificationsPlugin.initialize(
    settings,
    onSelectNotification: (payload) {
      if (payload != null) {
        final Map<String, dynamic> decodedPayload = jsonDecode(payload);
        if (decodedPayload.isNotEmpty) {
          final ntf = AppNotificationModel.fromJson(decodedPayload).toEntity();
          sub.read().update((_) => Some(ntf));
        }
      }
    },
  );
  ref.keepAlive();
  return flutterLocalNotificationsPlugin;
}
