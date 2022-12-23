import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
AppLocale currentAppLocale(CurrentAppLocaleRef ref) {
  final AppLocale? locale =
      ref.watch(appLocaleControllerProvider.select((data) => data.valueOrNull));
  return locale ?? AppLocale.english;
}
