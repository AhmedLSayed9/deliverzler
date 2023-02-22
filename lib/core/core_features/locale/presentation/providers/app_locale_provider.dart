import 'package:intl/date_symbol_data_local.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import '../../domain/use_cases/get_app_locale_uc.dart';
import '../../domain/use_cases/set_app_locale_uc.dart';
import '../utils/app_locale.dart';

part 'app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLocaleController extends _$AppLocaleController {
  bool firstBuild = true;

  @override
  Future<AppLocale> build() async {
    await ref.watch(sharedPrefsFutureProvider.future);
    _getAppLocaleUC = ref.watch(getAppLocaleUCProvider);
    _setAppLocaleUC = ref.watch(setAppLocaleUCProvider);
    if (firstBuild) {
      _setTimeAgoLocales();
      await _initDateFormatting();
      firstBuild = false;
    }
    return _getUserStoredLocale();
  }

  late final GetAppLocaleUC _getAppLocaleUC;
  late final SetAppLocaleUC _setAppLocaleUC;

  void _setTimeAgoLocales() {
    //Note: en messages is loaded by default
    timeago.setLocaleMessages(AppLocale.arabic.code, timeago.ArMessages());
  }

  Future<void> _initDateFormatting() async {
    await initializeDateFormatting();
  }

  Future<AppLocale> _getUserStoredLocale() async {
    final storedLocale = await _getAppLocaleUC();
    return AppLocale.values.firstWhere((l) => l.code == storedLocale);
  }

  Future<void> changeLocale(AppLocale appLocale) async {
    state = AsyncData(appLocale);
    await _setAppLocaleUC(appLocale.code);
  }
}
