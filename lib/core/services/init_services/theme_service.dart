import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  ThemeService._();

  static final instance = ThemeService._();

  changeTheme({required ThemeMode themeMode}) {
    Get.changeThemeMode(themeMode);
    setUserStoredTheme(themeMode);
  }

  Future setUserStoredTheme(ThemeMode themeMode) async {
    final theme = themeMode == ThemeMode.light ? 'light' : 'dark';
    (await SharedPreferences.getInstance()).setString(
      'user_stored_theme',
      theme,
    );
  }

  Future<ThemeMode> getUserStoredTheme() async {
    String? userStoredTheme =
        (await SharedPreferences.getInstance()).getString('user_stored_theme');
    if (userStoredTheme == null) {
      return ThemeMode.system;
    } else {
      return userStoredTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
    }
  }
}
