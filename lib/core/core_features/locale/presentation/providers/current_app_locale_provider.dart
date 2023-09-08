import '../../../../presentation/utils/riverpod_framework.dart';
import '../utils/app_locale.dart';
import 'app_locale_provider.dart';

part 'current_app_locale_provider.g.dart';

@Riverpod(keepAlive: true)
AppLocale currentAppLocale(CurrentAppLocaleRef ref) {
  final locale = ref.watch(appLocaleControllerProvider.select((data) => data.valueOrNull));
  return locale ?? AppLocale.english;
}
