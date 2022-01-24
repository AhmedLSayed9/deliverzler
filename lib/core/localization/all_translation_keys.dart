import 'package:get/get.dart';
import 'package:deliverzler/authentication/localization/en.dart';
import 'package:deliverzler/authentication/localization/ar.dart';
import 'package:deliverzler/core/localization/ar.dart';
import 'package:deliverzler/core/localization/en.dart';
import 'package:deliverzler/general/localization/en.dart';
import 'package:deliverzler/general/localization/ar.dart';
import 'package:deliverzler/modules/home/localization/en.dart';
import 'package:deliverzler/modules/home/localization/ar.dart';
import 'package:deliverzler/modules/map/localization/en.dart';
import 'package:deliverzler/modules/map/localization/ar.dart';
import 'package:deliverzler/modules/profile/localization/en.dart';
import 'package:deliverzler/modules/profile/localization/ar.dart';

class LanguageTranslation extends Translations {
  Map<String, String> en = coreEn;
  Map<String, String> ar = coreAr;

  LanguageTranslation() {
    en
      ..addAll(authEn)
      ..addAll(generalEn)
      ..addAll(profileEn)
      ..addAll(ordersEn)
      ..addAll(mapEn);
    ar
      ..addAll(authAr)
      ..addAll(generalAr)
      ..addAll(profileAr)
      ..addAll(ordersAr)
      ..addAll(mapAr);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
