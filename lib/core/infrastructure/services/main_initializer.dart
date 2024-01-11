part of '../../../main.dart';

Future<ProviderContainer> _mainInitializer() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  _setupLogger();
  await _initFirebase();

  final container = ProviderContainer(observers: [ProviderLogger(), ProviderCrashlytics()]);
  // Warming-up androidDeviceInfoProvider to be used synchronously at AppTheme to setup the navigation bar
  // behavior for older Android versions without flickering (of the navigation bar) when app starts.
  await container.read(androidDeviceInfoProvider.future).suppressError();
  // Warming-up sharedPrefsAsyncProvider to be used synchronously at theme/locale. Not warming-up this
  // at splashServicesWarmup as theme/locale is used early at SplashScreen (avoid theme/locale flickering).
  await container.read(sharedPrefsAsyncProvider.future).suppressError();

  // This Prevent closing native splash screen until we finish warming-up custom splash images.
  // App layout will be built but not displayed.
  widgetsBinding.deferFirstFrame();
  widgetsBinding.addPostFrameCallback((_) async {
    // Run any function you want to wait for before showing app layout.
    final BuildContext context = widgetsBinding.rootElement!;
    await _precacheAssets(context);

    // When the native splash screen is fullscreen, iOS will not automatically show the notification
    // bar when the app loads. To show it, setEnabledSystemUIMode has to be explicitly set:
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge, // https://github.com/flutter/flutter/issues/105714
    );

    // Closes splash screen, and show the app layout.
    widgetsBinding.allowFirstFrame();
  });

  return container;
}

void _setupLogger() {
  hierarchicalLoggingEnabled = true;
  Logger.root.level = Level.ALL;
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _precacheAssets(BuildContext context) async {
  await <Future<void>>[
    SplashScreen.precacheAssets(context),
  ].wait.suppressError();
}

/// This provided handler must be a top-level function.
/// It works outside the scope of the app in its own isolate.
/// More details: https://firebase.google.com/docs/cloud-messaging/flutter/receive#background_messages
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  log('Handling a background message ${message.messageId}');
}
