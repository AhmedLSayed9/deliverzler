import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';

class Validators {
  Validators._();

  static final Validators instance = Validators._();

  String? Function(String?)? validateMobileNumber() {
    Pattern patternMobileNumber =
        r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr(NavigationService.context).thisFieldIsEmpty;
      } else if (value.contains("+") &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains(RegExp(r'[a-zA-Z]')) &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        return tr(NavigationService.context).pleaseEnterValidNumber;
      } else if (!value.contains(RegExp(r'[a-zA-Z]')) &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains("+") &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        if (checkPattern(pattern: patternMobileNumber, value: value)) {
          return tr(NavigationService.context).pleaseEnterValidNumber;
        }
      }
      return null;
    };
  }

  String? Function(String?)? validateName() {
    String patternName =
        r"^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-_]*$";
    return (value) {
      if (value!.isEmpty) {
        return tr(NavigationService.context).thisFieldIsEmpty;
      } else if (value.toString().length < 2 &&
          !checkPattern(pattern: patternName, value: value)) {
        return tr(NavigationService.context).nameMustBeAtLeast2Letters;
      } else if (value.toString().length > 30) {
        return tr(NavigationService.context).nameMustBeAtMost30Letters;
      } /*else if (checkPattern(pattern: patternName, value: value)) {
        return tr(NavigationService.context).pleaseEnterValidName;
      }*/
      else {
        return null;
      }
    };
  }

  String? validateEmail(String? value) {
    String patternEmail = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    if (value!.isEmpty) {
      return tr(NavigationService.context).thisFieldIsEmpty;
    } else if (checkPattern(pattern: patternEmail, value: value)) {
      return tr(NavigationService.context).pleaseEnterValidEmail;
    } else {
      return null;
    }
  }

  String? validateLoginPassword(String? value) {
    if (value!.isEmpty) {
      return tr(NavigationService.context).thisFieldIsEmpty;
    } else {
      return null;
    }
  }

  bool isNumeric(String str) {
    Pattern patternInteger = r'^-?[0-9]+$';
    return checkPattern(pattern: patternInteger, value: str);
  }

  bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    if (regularCheck.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
