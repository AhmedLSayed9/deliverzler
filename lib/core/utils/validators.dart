import 'package:deliverzler/core/localization/app_localization.dart';

class Validators {
  Validators._();

  static final Validators instance = Validators._();

  String? Function(String?)? validateMobileNumber() {
    Pattern patternMobileNumber =
        r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr("ThisFieldIsEmpty");
      } else if (value.contains("+") &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains(RegExp(r'[a-zA-Z]')) &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        return tr("pleaseEnterValidNumber");
      } else if (!value.contains(RegExp(r'[a-zA-Z]')) &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains("+") &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        if (checkPattern(pattern: patternMobileNumber, value: value)) {
          return tr("pleaseEnterValidNumber");
        }
      }
    };
  }

  String? Function(String?)? validateName() {
    String patternName =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$";
    return (value) {
      if (value!.isEmpty) {
        return tr("ThisFieldIsEmpty");
      } else if (value.toString().length < 2 &&
          !checkPattern(pattern: patternName, value: value)) {
        return tr("nameMustBeAtLeast2Letters");
      } else if (value.toString().length > 30) {
        return tr("nameMustBeAtMost30Letters");
      } /*else if (checkPattern(pattern: patternName, value: value)) {
        return tr("pleaseEnterValidName");
      }*/
    };
  }

  String? Function(String?)? validateEmail() {
    String patternEmail = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    return (value) {
      if (value!.isEmpty) {
        return tr('ThisFieldIsEmpty');
      } else if (checkPattern(pattern: patternEmail, value: value)) {
        return tr('pleaseEnterValidEmail');
      }
    };
  }

  String? Function(String?)? validateLoginPassword() {
    return (value) {
      if (value!.isEmpty) {
        return tr("ThisFieldIsEmpty");
      }
    };
  }

  bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
