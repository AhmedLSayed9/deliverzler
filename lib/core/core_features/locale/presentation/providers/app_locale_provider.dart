import 'package:intl/date_symbol_data_local.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../infrastructure/local/shared_preferences_facade.dart';
import '../../../../presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/locale_repo.dart';
import '../utils/app_locale.dart';

part 'app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
class AppLocaleController extends _$AppLocaleController {
  bool _firstBuild = true;

  @override
  Future<AppLocale> build() async {
    await ref.watch(sharedPrefsAsyncProvider.future);
    if (_firstBuild) {
      _setTimeAgoLocales();
      await _initDateFormatting();
      _firstBuild = false;
    }
    return _getUserStoredLocale();
  }

  void _setTimeAgoLocales() {
    //Note: en messages is loaded by default
    timeago.setLocaleMessages(AppLocale.arabic.code, timeago.ArMessages());
  }

  Future<void> _initDateFormatting() async {
    await initializeDateFormatting();
  }

  Future<AppLocale> _getUserStoredLocale() async {
    final storedLocale = await ref.watch(localeRepoProvider).getAppLocale();
    return AppLocale.values.firstWhere((l) => l.code == storedLocale);
  }

  Future<void> changeLocale(AppLocale appLocale) async {
    state = AsyncData(appLocale);
    await ref.read(localeRepoProvider).cacheAppLocale(appLocale.code);
  }
}
