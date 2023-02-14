import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/app_locale.dart';
import 'app_locale_provider.dart';

part 'current_app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
AppLocale currentAppLocale(CurrentAppLocaleRef ref) {
  final AppLocale? locale =
      ref.watch(appLocaleControllerProvider.select((data) => data.valueOrNull));
  return locale ?? AppLocale.english;
}
