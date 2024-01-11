import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_service.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import 'fcm_remote_message_providers.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationPayload with _$NotificationPayload {
  const factory NotificationPayload({
    required String? routeLocation,
    required Map<String, dynamic>? data,
  }) = _NotificationPayload;

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$NotificationPayloadFromJson(json);
}

@riverpod
Option<NotificationPayload> tappedNotification(TappedNotificationRef ref) {
  void updateState(NotificationPayload ntf) {
    ref.state = Some(ntf);
    ref.notifyListeners();
  }

  ref.listen(getInitialMessageProvider, (previous, next) {
    next.whenData((message) {
      if (message is Some<RemoteMessage> && message.value.data.isNotEmpty) {
        final ntf = NotificationPayload.fromJson(message.value.data);
        updateState(ntf);
      }
    });
  });

  ref.listen(onMessageOpenedAppProvider, (previous, next) {
    next.whenData(
      (message) {
        if (message.data.isNotEmpty) {
          final ntf = NotificationPayload.fromJson(message.data);
          updateState(ntf);
        }
      },
    );
  });

  ref.listen(notificationResponseEventProvider, (previous, next) {
    if (next is Some<NotificationResponse>) {
      final payload = next.value.payload;
      if (payload == null || payload.isEmpty) return;

      final decodedPayload = jsonDecode(payload) as Map<String, dynamic>;
      final ntf = NotificationPayload.fromJson(decodedPayload);
      updateState(ntf);
    }
  });

  return const None();
}
