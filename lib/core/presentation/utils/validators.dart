import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/localization_helper.dart';

final validatorsProvider = Provider<Validators>((ref) {
  return Validators();
});

class Validators {
  String? Function(String?)? validateMobileNumber(BuildContext context) {
    Pattern patternMobileNumber =
        r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (value.contains("+") &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains(RegExp(r'[a-zA-Z]')) &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        return tr(context).pleaseEnterValidNumber;
      } else if (!value.contains(RegExp(r'[a-zA-Z]')) &&
          value.contains(RegExp(r'[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains("+") &&
          !value.contains(RegExp(r'[ء-ي]'))) {
        if (!checkPattern(pattern: patternMobileNumber, value: value)) {
          return tr(context).pleaseEnterValidNumber;
        }
      }
      return null;
    };
  }

  String? Function(String?)? validateName(BuildContext context) {
    //english name: r'^[a-zA-Z,.\-]+$'
    //arabic name: r'^[\u0621-\u064A\040]+$'
    //english and arabic names
    String patternName = r"^[\u0621-\u064A\040\a-zA-Z,.\-]+$";
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (value.toString().length < 2) {
        return tr(context).nameMustBeAtLeast2Letters;
      } else if (value.toString().length > 30) {
        return tr(context).nameMustBeAtMost30Letters;
      } else if (!checkPattern(pattern: patternName, value: value)) {
        return tr(context).pleaseEnterValidName;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateEmail(BuildContext context) {
    String patternEmail = r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: patternEmail, value: value)) {
        return tr(context).pleaseEnterValidEmail;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateLoginPassword(BuildContext context) {
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else {
        return null;
      }
    };
  }
  /*String? Function(String?)? validateEmptyField(BuildContext context) {
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else {
        return null;
      }
    };
  }

  String? Function(dynamic)? validateEmptySelection(BuildContext context) {
    return (value) {
      if (value == null) {
        return tr(context).thisSelectionIsEmpty;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateSingleName(BuildContext context) {
    //english name: r'^[a-zA-Z,.\-]+$'
    //arabic name: r'^[\u0621-\u064A\040]+$'
    //english and arabic names
    String patternName = r"^[\u0621-\u064A\040\a-zA-Z,.\-]+$";
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: patternName, value: value)) {
        return tr(context).pleaseEnterValidName;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateName(BuildContext context) {
    //english name: r'^[a-zA-Z,.\-]+$'
    //arabic name: r'^[\u0621-\u064A\040]+$'
    //english and arabic names
    String patternName = r"^[\u0621-\u064A\040\a-zA-Z,.\-]+$";
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (value.toString().length < 15) {
        return tr(context).nameMustBeAtLeast15Letters;
      } else if (value.toString().length > 40) {
        return tr(context).nameMustBeAtMost40Letters;
      } else if (!checkPattern(pattern: patternName, value: value)) {
        return tr(context).pleaseEnterValidName;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateMobileNumber(BuildContext context) {
    ///Saudi arabia mobile number validation
    Pattern patternMobileNumber = r'^(05)[0-9]{8}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: patternMobileNumber, value: value)) {
        return tr(context).pleaseEnterValidNumber;
      }
      return null;
    };
  }

  String? Function(String?)? validateEmail(BuildContext context) {
    String _patternEmail =
        r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: _patternEmail, value: value)) {
        return tr(context).pleaseEnterValidEmail;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateIdNumber(BuildContext context) {
    ///Saudi arabia id number validation
    Pattern patternIdNumber = r'^[0-9]{10}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: patternIdNumber, value: value)) {
        return tr(context).pleaseEnterValidIdNumber;
      }
      return null;
    };
  }

  String? Function(String?)? validateCreatePassword(BuildContext context) {
    String _patternEmail =
        r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!-_@\#&$%^*]).{8,32}$';
    */ /*
    (?=.*[A-Z])       // should contain at least one upper case
    (?=.*[a-z])       // should contain at least one lower case
    (?=.*?[0-9])      // should contain at least one digit
    (?=.*?[!@#\$&*~]) // should contain at least one Special character
    .{8,}             // Must be at least 8 characters in length  */ /*
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!checkPattern(pattern: _patternEmail, value: value)) {
        return tr(context).passwordIsNotStrong;
      } else {
        return null;
      }
    };
  }

  String? validateConfirmPassword(
      BuildContext context, String password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return tr(context).thisFieldIsEmpty;
    } else if (confirmPassword != password) {
      return tr(context).confirmPasswordDoNotMatch;
    } else {
      return null;
    }
  }

  String? Function(String?)? validatePositiveInteger(BuildContext context) {
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!isNumericPositive(value)) {
        return tr(context).pleaseEnterValidNumberGreaterThanZero;
      } else {
        return null;
      }
    };
  }

  String? Function(String?)? validateSponsorshipPartialAmount(
      BuildContext context, double minAmount) {
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (!isNumericPositive(value)) {
        return tr(context).pleaseEnterValidNumberGreaterThanZero;
      } else if (int.parse(value) < minAmount) {
        return tr(context)
            .partialSponsorshipMustBeGreaterThan(minAmount.toStringAsFixed(0));
      } else {
        return null;
      }
    };
  }*/

  static bool isNumeric(String str) {
    Pattern patternInteger = r'^-?[0-9]+$';
    return checkPattern(pattern: patternInteger, value: str);
  }

  static bool isNumericPositive(String str) {
    Pattern patternPositiveInteger = r'^[1-9]\d*$';
    return checkPattern(pattern: patternPositiveInteger, value: str);
  }

  static bool checkPattern({pattern, value}) {
    RegExp regularCheck = RegExp(pattern);
    return regularCheck.hasMatch(value);
  }
}
