import 'package:flutter/foundation.dart';

class GoogleMapApiConfig {
  static const String googleMapBaseUrl = 'https://maps.googleapis.com/maps/api';

  //It's safe to store your google map API key in the source code as long as you restrict your API key
  //by limiting which app can use it (Application restrictions)
  //& by limiting their usage to those only APIs needed for your application (API restrictions)
  //These restrictions is set in your Google Cloud console and is not exposed anywhere in your source code.
  //You can set one application restriction per key, so you need to create a separate API key for each app, and for each platform on which that app is available.
  //For more details: https://developers.google.com/maps/documentation/android-sdk/get-api-key#restrict_key
  static const String androidAPIKey = 'EnterYourAndroidGoogleMapApiKey';
  static const String iosAPIKey = 'EnterYourIOSGoogleMapApiKey';

  static String get googleMapAPIKey =>
      defaultTargetPlatform == TargetPlatform.iOS ? iosAPIKey : androidAPIKey;

  static const googleMapAPIParamKey = 'key';

  static const withSessionTokenExtraKey = 'withSessionToken';
  static const sessionTokenHeaderKey = 'sessiontoken';
}
