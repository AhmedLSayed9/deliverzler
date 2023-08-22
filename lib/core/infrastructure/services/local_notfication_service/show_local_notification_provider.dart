import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../../../presentation/utils/riverpod_framework.dart';
import 'flutter_local_notifications_provider.dart';

part 'show_local_notification_provider.g.dart';

@riverpod
Future<void> showLocalNotification(
  ShowLocalNotificationRef ref,
  ShowLocalNotificationParams params,
) async {
  final notificationService = ref.watch(flutterLocalNotificationsProvider);

  return notificationService.show(
    0,
    params.title,
    params.body,
    localNotificationDetails,
    payload: params.payload,
  );
}

class ShowLocalNotificationParams {
  const ShowLocalNotificationParams({this.title, this.body, this.payload});
  final String? title, body, payload;
}

const localNotificationDetails = NotificationDetails(
  android: AndroidNotificationDetails(
    'local_push_notification',
    'Deliverzler Notifications',
    channelDescription: 'This channel is used for important notifications.',
    importance: Importance.max,
    priority: Priority.high,
    color: AppStaticColors.primary,
    enableLights: true,
  ),
  iOS: IOSNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  ),
);
