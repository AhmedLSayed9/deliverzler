import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/storage_service.dart';
import 'package:deliverzler/core/utils/storage_keys.dart';

final appThemeProvider =
    StateNotifierProvider<AppThemeNotifier, ThemeMode?>((ref) {
  return AppThemeNotifier(ref);
});

class AppThemeNotifier extends StateNotifier<ThemeMode> {
  AppThemeNotifier(this.ref) : super(ThemeMode.system) {
    _storageService = ref.watch(storageService);
  }

  final Ref ref;
  late IStorageService _storageService;

  init() async {
    await getUserStoredTheme();
  }

  Future getUserStoredTheme() async {
    late ThemeMode _themeMode;
    final _storedTheme = await _storageService.restoreData(
      key: StorageKeys.theme,
      dataType: DataType.string,
    );
    if (_storedTheme != null) {
      _themeMode = _storedTheme == 'light' ? ThemeMode.light : ThemeMode.dark;
      state = _themeMode;
    }
  }

  changeTheme({required bool isLight}) {
    final _theme = isLight ? ThemeMode.light : ThemeMode.dark;
    state = _theme;
    setUserStoredTheme(_theme);
  }

  Future setUserStoredTheme(ThemeMode themeMode) async {
    final theme = themeMode == ThemeMode.light ? 'light' : 'dark';
    await _storageService.saveData(
      value: theme,
      key: StorageKeys.theme,
      dataType: DataType.string,
    );
  }
}
