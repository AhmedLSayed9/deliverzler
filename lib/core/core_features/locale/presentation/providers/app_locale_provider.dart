import 'package:deliverzler/core/core_features/locale/domain/use_cases/get_app_locale_uc.dart';
import 'package:deliverzler/core/core_features/locale/domain/use_cases/set_app_locale_uc.dart';
import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;

final appLocaleProvider =
    AsyncNotifierProvider<AppLocaleNotifier, AppLocale>(AppLocaleNotifier.new);

class AppLocaleNotifier extends AsyncNotifier<AppLocale> {
  @override
  Future<AppLocale> build() {
    _getAppLocaleUC = ref.watch(getAppLocaleUCProvider);
    _setAppLocaleUC = ref.watch(setAppLocaleUCProvider);
    setTimeAgoLocales();
    return _getUserStoredLocale();
  }

  late final GetAppLocaleUC _getAppLocaleUC;
  late final SetAppLocaleUC _setAppLocaleUC;

  Future<AppLocale> _getUserStoredLocale() async {
    final storedLocale = await _getAppLocaleUC();
    return AppLocale.values.firstWhere((l) => l.code == storedLocale);
  }

  void setTimeAgoLocales() {
    //Note: en messages is loaded by default
    timeago.setLocaleMessages(AppLocale.arabic.code, timeago.ArMessages());
  }

  Future<void> changeLocale(AppLocale appLocale) async {
    state = AsyncData(appLocale);
    await _setAppLocaleUC(appLocale.code);
  }
}
