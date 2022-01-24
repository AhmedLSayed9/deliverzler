import 'dart:core';

class AppImages {
  static const String jsonPath = 'assets/json/';
  static const String welcomeImagesPath = 'assets/images/welcome/';
  static const String loginImagesPath = 'assets/images/login/';
  static const String coreImagesPath = 'assets/images/core/';
  static const String dialogWidgetIconsPath =
      coreImagesPath + 'dialog_widget_icons/';
  static const String appIconsPath = 'assets/images/app_icons/';
  static const String appImagesPath = 'assets/images/app_images/';
  static const String appScreensIconsPath = appIconsPath + 'screens_icons/';
  static const String appLanguagesIconsPath = appIconsPath + 'languages_icons/';

  /// Splash Screen + OnBoarding
  static const String splash = welcomeImagesPath + 'splash.png';
  static const String splashAnimation = jsonPath + 'splash_animation.json';

  /// Login
  static const String loginBackground =
      loginImagesPath + 'login_background.png';
  static const String hiHand = loginImagesPath + 'hi_hand.png';

  /// Core
  static const String loadingAnimation = jsonPath + 'loading_animation.json';
  static const String loadingGIF = coreImagesPath + 'loading.gif';
  static const String appLogoIcon = coreImagesPath + 'icon.png';
  static const String cameraIcon = coreImagesPath + 'camera.png';
  static const String noInternet = coreImagesPath + 'no_internet.jpg';
  //Dialog Widget Icons
  static const String location = dialogWidgetIconsPath + 'location.png';
  static const String ask = dialogWidgetIconsPath + 'ask.png';
  static const String confirmation = dialogWidgetIconsPath + 'confirmation.png';
  static const String error = dialogWidgetIconsPath + 'error.png';
  static const String info = dialogWidgetIconsPath + 'info.png';
  static const String infoReverse = dialogWidgetIconsPath + 'info_reverse.png';
  static const String noHeader = dialogWidgetIconsPath + 'no_header.png';
  static const String success = dialogWidgetIconsPath + 'success.png';
  static const String warning = dialogWidgetIconsPath + 'warning.png';

  /// App
  //Screens Icons
  static const String profileScreenIcon = appScreensIconsPath + 'profile.png';
  static const String settingsScreenIcon = appScreensIconsPath + 'settings.png';
  static const String languageScreenIcon = appScreensIconsPath + 'language.png';
  //Languages Icons
  static const String languageIconEnglish =
      appLanguagesIconsPath + 'english.png';
  static const String languageIconArabic =
      appLanguagesIconsPath + 'arabic.png';
  //Map
  static const String mapLightStyle = jsonPath + 'map_styles/light.json';
  static const String mapDarkStyle = jsonPath + 'map_styles/dark.json';
  static const String mapDeliveryIcon = appIconsPath + 'delivery_icon.png';
}
