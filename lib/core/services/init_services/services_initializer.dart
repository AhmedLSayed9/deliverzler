import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/services/init_services/local_notification_service.dart';
import 'package:deliverzler/core/services/init_services/storage_service.dart';
import 'package:deliverzler/core/services/init_services/theme_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:deliverzler/firebase_options.dart';

class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  initializeSettings() async {
    //This method is used to initialize any service before the app runs (in main method)
    await initializeStorageService();
    List futures = [
      initializeLocalization(),
      initializeTheme(),
      initializeConnectivity(),
      initializeNotificationSettings(),
      initializeFirebase(),
      //initializeScreensOrientation(),
    ];
    List<dynamic> result = await Future.wait([...futures]);
    return result;
  }

  initializeStorageService() async {
    await StorageService.instance.initialize();
  }

  initializeLocalization() async {
    return await AppLocalizations.instance.getUserStoredLocale();
  }

  initializeTheme() async {
    return await ThemeService.instance.getUserStoredTheme();
  }

  initializeConnectivity() async {
    ConnectivityService.instance.initializeConnectivityListeners();
  }

  initializeNotificationSettings() async {
    await LocalNotificationService.instance.initNotificationSettings();
  }

  initializeFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initializeFirebaseMessaging();
  }

  initializeFirebaseMessaging() async {
    await FirebaseMessagingService.instance.initFirebaseMessaging();
  }

  initializeScreensOrientation() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
  }

  Future initializeData() async {
    List futures = [
      cacheDefaultImages(),
    ];
    List<dynamic> result = await Future.wait<dynamic>([...futures]);
    return result;
  }

  cacheDefaultImages() async {
    precacheImage(const AssetImage(AppImages.appLogoIcon), Get.context!);
    precacheImage(const AssetImage(AppImages.splash), Get.context!);
  }
}
