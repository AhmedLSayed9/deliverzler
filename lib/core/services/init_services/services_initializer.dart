import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/services/init_services/local_notification_service.dart';
import 'package:deliverzler/core/services/init_services/storage_service.dart';
import 'package:deliverzler/core/services/theme_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/viewmodels/app_locale_provider.dart';
import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deliverzler/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServicesInitializer {
  ServicesInitializer._();

  static final ServicesInitializer instance = ServicesInitializer._();

  late ProviderContainer _container;
  late WidgetRef _ref;

  initializeServices(ProviderContainer container) async {
    _container = container;
    await initStorageService();
    await initLocalization();
    await initTheme();
    await initConnectivity();
    await initNotificationSettings();
    await initFirebase();
  }

  initStorageService() async {
    await StorageService.instance.init();
  }

  initLocalization() async {
    await _container.read(appLocaleProvider.notifier).init();
  }

  initTheme() async {
    await _container.read(appThemeProvider.notifier).init();
  }

  initConnectivity() async {
    ConnectivityService.instance.init();
  }

  initNotificationSettings() async {
    await LocalNotificationService.instance.init();
  }

  initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initFirebaseMessaging();
  }

  initFirebaseMessaging() async {
    await FirebaseMessagingService.instance.init();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  initializeServicesRef(WidgetRef ref) {
    _ref = ref;
    initThemeServiceRef();
  }

  initThemeServiceRef() {
    ThemeService(_ref);
  }

  Future initializeData() async {
    List futures = [
      cacheDefaultImages(),
    ];
    List<dynamic> result = await Future.wait<dynamic>([...futures]);
    return result;
  }

  cacheDefaultImages() async {
    precacheImage(
        const AssetImage(AppImages.appLogoIcon), NavigationService.context);
    precacheImage(
        const AssetImage(AppImages.splash), NavigationService.context);
  }
}
