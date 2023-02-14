import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../domain/use_cases/get_app_locale_uc.dart';
import '../../domain/use_cases/set_app_locale_uc.dart';
import '../utils/app_locale.dart';

part 'app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLocaleController extends _$AppLocaleController {
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
