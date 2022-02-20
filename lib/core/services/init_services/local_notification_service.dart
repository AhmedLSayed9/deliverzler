import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:deliverzler/core/models/payload_model.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';

class LocalNotificationService {
  LocalNotificationService._();

  static final instance = LocalNotificationService._();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future initNotificationSettings() async {
    const AndroidInitializationSettings _androidInitializationSettings =
        AndroidInitializationSettings('notification_icon');
    const IOSInitializationSettings _iosInitializationSettings =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      requestBadgePermission: false,
    );
    const InitializationSettings _initializationSettings =
        InitializationSettings(
      android: _androidInitializationSettings,
      iOS: _iosInitializationSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(
      _initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  onSelectNotification(String? payload) async {
    if (payload != null) {
      final _payloadModel = PayloadModel.fromJsonString(payload);
      if (_payloadModel.data != null &&
          _payloadModel.data!.containsKey('orderId')) {
        NavigationService.pushReplacement(
          isNamed: true,
          page: _payloadModel.route,
          arguments: {'orderId': _payloadModel.data!['orderId']},
        );
      } else {
        NavigationService.pushReplacement(
          isNamed: true,
          page: _payloadModel.route,
        );
      }
    }
  }

  Future showInstantNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails(),
      payload: payload,
    );
  }

  _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'local_push_notification',
        'Deliverzler Notifications',
        channelDescription: 'This channel is used for important notifications.',
        importance: Importance.max,
        priority: Priority.high,
        color: AppColors.primaryColor,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}
