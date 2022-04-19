import 'dart:convert';

import 'package:deliverzler/modules/home/viewmodels/notification_order_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:deliverzler/modules/notifications/models/notification_model.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocalNotificationService {
  LocalNotificationService._();

  static final instance = LocalNotificationService._();

  factory LocalNotificationService(ProviderContainer container) {
    instance._container = container;
    return instance;
  }

  late ProviderContainer _container;

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future init() async {
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
    if (FirebaseAuth.instance.currentUser == null) return;

    if (payload != null) {
      final _decodedPayload = jsonDecode(payload) as Map<String, dynamic>;
      if (_decodedPayload.isNotEmpty) {
        final _notificationModel = NotificationModel.fromMap(_decodedPayload);
        NavigationService.pushReplacement(
          NavigationService.context,
          isNamed: true,
          page: _notificationModel.route,
        );
        if (_notificationModel.data?.containsKey('orderId') ?? false) {
          _container
              .read(notificationOrderViewModel)
              .navigateToNotificationOrder(_notificationModel.data!['orderId']);
        }
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
        color: AppColors.lightThemePrimary,
        playSound: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}
