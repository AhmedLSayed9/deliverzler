part of '../../../main.dart';

Future<void> _mainInitializer() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
  //This Prevent closing native splash screen until we finish warming-up custom splash images.
  //App layout will be built but not displayed.
  widgetsBinding.deferFirstFrame();
  widgetsBinding.addPostFrameCallback((_) async {
    //Run any function you want to wait for before showing app layout
    final BuildContext context = widgetsBinding.renderViewElement!;
    await _precacheCustomSplashImages(context);
    // Closes splash screen, and show the app layout.
    widgetsBinding.allowFirstFrame();
  });
}

_initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _precacheCustomSplashImages(BuildContext context) async {
  await Future.wait([
    precacheImage(const AssetImage(AppImages.splash), context),
  ]);
}

//This provided handler must be a top-level function.
//It works outside the scope of the app in its own isolate.
//More details: https://firebase.google.com/docs/cloud-messaging/flutter/receive#background_messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  log('Handling a background message ${message.messageId}');
}
