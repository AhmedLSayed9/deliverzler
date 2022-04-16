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
//import 'package:deliverzler/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServicesInitializer {
  ServicesInitializer._();

  static final ServicesInitializer instance = ServicesInitializer._();

  late ProviderContainer _container;

  init(WidgetsBinding widgetsBinding, ProviderContainer container) async {
    _container = container;
    //Init FirebaseApp instance before runApp
    await _initFirebase();
    //This Prevent closing splash screen until we finish initializing our services.
    //App layout will be built but not displayed.
    widgetsBinding.deferFirstFrame();
    widgetsBinding.addPostFrameCallback((_) async {
      //Run any function you want to wait for before showing app layout
      //await _initializeServices(); init services at custom splash
      _initializeServicesRef();
      BuildContext? context = widgetsBinding.renderViewElement;
      if (context != null) {
        await _initializeCustomSplashImages(context);
      }
      // Closes splash screen, and show the app layout.
      widgetsBinding.allowFirstFrame();
    });
  }

  _initializeServicesRef() {
    ThemeService(_container.read);
  }

  _initializeCustomSplashImages(BuildContext context) async {
    await precacheImage(const AssetImage(AppImages.appLogoIcon), context);
  }

  initializeServices() async {
    await _initStorageService();
    await _initLocalization();
    await _initTheme();
    await _initConnectivity();
    await _initNotificationSettings();
    await _initFirebaseMessaging();
  }

  _initStorageService() async {
    await StorageService.instance.init();
  }

  _initLocalization() async {
    await _container.read(appLocaleProvider.notifier).init();
  }

  _initTheme() async {
    await _container.read(appThemeProvider.notifier).init();
  }

  _initConnectivity() async {
    ConnectivityService.instance.init();
  }

  _initNotificationSettings() async {
    await LocalNotificationService(_container).init();
  }

  _initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  _initFirebaseMessaging() async {
    await FirebaseMessagingService.instance.init();
  }

  Future initializeData() async {
    List futures = [
      _cacheDefaultImages(),
    ];
    List<dynamic> result = await Future.wait<dynamic>([...futures]);
    return result;
  }

  _cacheDefaultImages() async {
    await precacheImage(
        const AssetImage(AppImages.appLogoIcon), NavigationService.context);
  }
}
