import 'dart:convert';

import 'package:deliverzler/core/services/init_services/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:deliverzler/core/styles/app_colors.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._();

  static final instance = FirebaseMessagingService._();

  bool _isInitialized = false;

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'firebase_push_notification',
    'Deliverzler Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  Future initFirebaseMessaging() async {
    if (_isInitialized) return;

    //On iOS, macOS & web, before FCM payloads can be received on your device
    //you must first ask the user's permission.
    //Android applications are not required to request permission.
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: true,
      sound: true,
    );
    debugPrint('User granted permission: ${settings.authorizationStatus}');
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    // Create an Android Notification Channel.
    // We use this channel in the `AndroidManifest.xml` file to override the
    // default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Update the iOS foreground notification presentation options to allow
    // heads up notifications on Apple devices.
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      sound: true,
      badge: false,
    );

    // Called when FCM payload is received while the app is in the foreground.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //In the foreground will not display a visible notification by default, on both Android & iOS.
      //It is however possible to override this behavior by using FlutterLocalNotificationsPlugin.
      //Also you can handle pressing a notification on foreground with onSelectNotification & payload.
      _showNotification(message);
    });

    // Called when a user presses a notification message displayed via FCM.
    // Only if the app has opened from background state (not foreground or terminated).
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final _messageData = message.data;
      LocalNotificationService.instance.onSelectNotification(
        jsonEncode(_messageData),
      );
    });

    //Set a message handler function which is called when the app is in the background or terminated.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _isInitialized = true;
  }

  _showNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    final _messageData = message.data;
    if (notification != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _notificationDetails(),
        payload: jsonEncode(_messageData),
      );
    }
  }

  _notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        importance: channel.importance,
        priority: Priority.high,
        color: AppColors.primaryColor,
        playSound: true,
      ),
      iOS: const IOSNotificationDetails(),
    );
  }

  getInitialMessage() {
    // Called when the application open from a terminated state.
    // If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
    // Should be called in app initState or at home screen because we need context for navigation.
    firebaseMessaging.getInitialMessage().then((message) {
      if (message != null) {
        final _messageData = message.data;
        LocalNotificationService.instance.onSelectNotification(
          jsonEncode(_messageData),
        );
      }
    });
  }

  getDeviceFCMToken() async {
    return await firebaseMessaging.getToken();
  }

  deleteDeviceFCMToken() async {
    await firebaseMessaging.deleteToken();
  }

  subscribeToTopic({required String topic}) async {
    await firebaseMessaging.subscribeToTopic(topic);
  }

  unsubscribeFromTopic({required String topic}) async {
    await firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

//This provided handler must be a top-level function.
//It works outside the scope of the app in its own isolate.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.messageId}');
}
