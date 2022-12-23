import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentAppLocaleProvider = Provider<AppLocale>((ref) {
  final AppLocale? locale =
      ref.watch(appLocaleProvider.select((data) => data.valueOrNull));
  return locale ?? AppLocale.english;
});
