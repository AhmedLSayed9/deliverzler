import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/storage_service.dart';
import 'package:deliverzler/core/utils/storage_keys.dart';
import 'package:timeago/timeago.dart' as timeago;

final appLocaleProvider =
    StateNotifierProvider<AppLocaleNotifier, Locale?>((ref) {
  return AppLocaleNotifier(ref);
});

class AppLocaleNotifier extends StateNotifier<Locale?> {
  AppLocaleNotifier(this.ref) : super(null) {
    _storageService = ref.watch(storageService);
  }

  final Ref ref;
  late IStorageService _storageService;

  init() async {
    await getUserStoredLocale();
    setTimeAgoLocales();
  }

  getUserStoredLocale() async {
    final _appLocale = await _storageService.restoreData(
      key: StorageKeys.locale,
      dataType: DataType.string,
    );
    state = _appLocale != null ? Locale(_appLocale!) : null;
  }

  setTimeAgoLocales() {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
  }

  changeLocale({required String languageCode}) {
    state = Locale(languageCode);
    setUserStoredLocale(languageCode: languageCode);
  }

  Future setUserStoredLocale({required String languageCode}) async {
    await _storageService.saveData(
      value: languageCode,
      key: StorageKeys.locale,
      dataType: DataType.string,
    );
  }
}
