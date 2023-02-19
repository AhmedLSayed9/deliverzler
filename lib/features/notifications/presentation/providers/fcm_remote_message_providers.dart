import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/presentation/services/fcm_service/fcm_provider.dart';
import '../../../../core/presentation/utils/functional.dart';

part 'fcm_remote_message_providers.g.dart';

@riverpod
Future<Option<RemoteMessage>> getInitialMessage(
    GetInitialMessageRef ref) async {
  // Called when the application open from a terminated state.
  // If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
  // Should be called in app initState or at home screen because we need context for navigation.
  final fcm = ref.watch(fcmProvider);
  final initialMsg = await fcm.getInitialMessage();
  return initialMsg.toOption();
}

final onMessageProvider = StreamProvider.autoDispose<RemoteMessage>((ref) {
  // Called when FCM payload is received while the app is in the foreground.
  return FirebaseMessaging.onMessage;
});

final onMessageOpenedAppProvider =
    StreamProvider.autoDispose<RemoteMessage>((ref) {
  // Called when a user presses a notification message displayed via FCM.
  // Only if the app has opened from background state (not foreground or terminated).
  return FirebaseMessaging.onMessageOpenedApp;
});
