import 'dart:convert';

import 'package:deliverzler/features/notifications/data/models/app_notification_model.dart';
import 'package:deliverzler/features/notifications/presentation/providers/tapped_notification_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final flutterLocalNotificationsProvider =
    Provider<FlutterLocalNotificationsPlugin>((ref) {
  final flutterLocalNotifications = ref.watch(
    setupFlutterLocalNotificationsProvider.select((value) => value.valueOrNull),
  );
  return flutterLocalNotifications ??
      (throw Exception(
          'setupFlutterLocalNotificationsProvider has not initialized'));
});

final setupFlutterLocalNotificationsProvider =
    FutureProvider<FlutterLocalNotificationsPlugin>(
  (ref) async {
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
            final notification = AppNotificationModel.fromMap(decodedPayload);
            ref.read(tappedNotificationProvider.notifier).state =
                Some(notification);
          }
        }
      },
    );
    return flutterLocalNotificationsPlugin;
  },
);
