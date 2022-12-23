import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core_features/locale/presentation/utils/app_locale.dart';

bool isRTL(BuildContext context) {
  return Localizations.localeOf(context).languageCode == AppLocale.arabic.code;
}

AppLocalizations tr(BuildContext context) {
  return AppLocalizations.of(context)!;
}
