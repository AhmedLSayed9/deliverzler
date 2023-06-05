import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/presentation/services/fcm_service/fcm_provider.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

part 'fcm_remote_message_providers.g.dart';

@riverpod
Future<Option<RemoteMessage>> getInitialMessage(
    GetInitialMessageRef ref) async {
  // Called when the application open from a terminated state.
  // If it opened via notification, RemoteMessage will be returned, otherwise it will be null.
  // Should be called in app initState or at home screen because we need context for navigation.
  final fcm = ref.watch(fcmProvider);
  final initialMsg = await fcm.getInitialMessage();
  return Option.fromNullable(initialMsg);
}

@riverpod
Stream<RemoteMessage> onMessage(OnMessageRef ref) {
  // Called when FCM payload is received while the app is in the foreground.
  return FirebaseMessaging.onMessage;
}

@riverpod
Stream<RemoteMessage> onMessageOpenedApp(OnMessageOpenedAppRef ref) {
  // Called when a user presses a notification message displayed via FCM.
  // Only if the app has opened from background state (not foreground or terminated).
  return FirebaseMessaging.onMessageOpenedApp;
}
