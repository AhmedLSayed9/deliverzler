import 'package:deliverzler/core/services/init_services/storage_service.dart';
import 'package:deliverzler/core/utils/storage_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appThemeProvider = StateProvider<ThemeMode?>((ref) => null);

class ThemeService {
  ThemeService._();

  static final instance = ThemeService._();

  changeTheme({required ThemeMode themeMode}) {
    setUserStoredTheme(themeMode);
  }

  Future setUserStoredTheme(ThemeMode themeMode) async {
    final theme = themeMode == ThemeMode.light ? 'light' : 'dark';
    (await SharedPreferences.getInstance()).setString(
      StorageKeys.theme,
      theme,
    );
  }

  Future<ThemeMode> getUserStoredTheme() async {
    String? userStoredTheme = await StorageService.instance.restoreData(
      key: StorageKeys.theme,
      dataType: DataType.string,
    );
    if (userStoredTheme == null) {
      return ThemeMode.system;
    } else {
      return userStoredTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
    }
  }
}