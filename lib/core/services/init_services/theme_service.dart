import 'package:deliverzler/core/services/init_services/history_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  ThemeService._();

  static final instance = ThemeService._();

  changeTheme({required ThemeMode themeMode}) {
    Get.changeThemeMode(themeMode);
    setUserStoredTheme(themeMode);
  }

  Future setUserStoredTheme(ThemeMode themeMode) async {
    final theme = themeMode == ThemeMode.light ? 'light' : 'dark';
    await HistoryService.instance.saveData(
      key: 'user_stored_theme',
      value: theme,
      dataType: DataType.string,
    );
  }

  Future<ThemeMode> getUserStoredTheme() async {
    String? userStoredTheme = await HistoryService.instance.restoreData(
      key: 'user_stored_theme',
      dataType: DataType.string,
    );
    if (userStoredTheme == null) {
      return ThemeMode.system;
    } else {
      return userStoredTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
    }
  }
}
