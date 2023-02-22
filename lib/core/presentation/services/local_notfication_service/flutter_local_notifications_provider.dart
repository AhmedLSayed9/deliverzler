import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../features/notifications/data/models/app_notification_model.dart';
import '../../../../features/notifications/domain/entities/app_notification.dart';
import '../../providers/provider_utils.dart';
import '../../utils/functional.dart';

part 'flutter_local_notifications_provider.g.dart';

@Riverpod(keepAlive: true)
FlutterLocalNotificationsPlugin flutterLocalNotifications(
    FlutterLocalNotificationsRef ref) {
  return ref.watch(setupFlutterLocalNotificationsProvider).requireValue;
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

  final sub = ref.listen(onSelectNotificationProvider.notifier, (prev, next) {});
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
  return flutterLocalNotificationsPlugin;
}

@Riverpod(keepAlive: true)
class OnSelectNotification extends _$OnSelectNotification with NotifierUpdate {
  @override
  Option<AppNotification> build() => const None();
}