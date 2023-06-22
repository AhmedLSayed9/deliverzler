import 'package:flutter/material.dart';

import '../presentation/helpers/localization_helper.dart';

class ValueValidators {
  static FormFieldValidator<String?> validateEmail(BuildContext context) {
    const patternEmail = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
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

  static FormFieldValidator<String?> validateLoginPassword(BuildContext context) {
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else {
        return null;
      }
    };
  }

  static FormFieldValidator<String?> validateMobileNumber(BuildContext context) {
    const patternMobileNumber = r'^(?:[+0]9)?[0-9|٩|٠|١|٢|٣|٤|٥|٦|٧|٨]{10,15}$';
    return (value) {
      value = value?.trim();
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (value.contains('+') &&
          value.contains(RegExp('[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains(RegExp('[a-zA-Z]')) &&
          !value.contains(RegExp('[ء-ي]'))) {
        return tr(context).pleaseEnterValidNumber;
      } else if (!value.contains(RegExp('[a-zA-Z]')) &&
          value.contains(RegExp('[0-9]|٩|٠|١|٢|٣|٤|٥|٦|٧|٨')) &&
          !value.contains('+') &&
          !value.contains(RegExp('[ء-ي]'))) {
        if (!checkPattern(pattern: patternMobileNumber, value: value)) {
          return tr(context).pleaseEnterValidNumber;
        }
      }
      return null;
    };
  }

  static FormFieldValidator<String?> validateName(BuildContext context) {
    //english name: r'^[a-zA-Z,.\-]+$'
    //arabic name: r'^[\u0621-\u064A\040]+$'
    //english and arabic names
    const patternName = r'^[\u0621-\u064A\040\a-zA-Z,.\-]+$';
    return (value) {
      if (value!.isEmpty) {
        return tr(context).thisFieldIsEmpty;
      } else if (value.length < 2) {
        return tr(context).nameMustBeAtLeast2Letters;
      } else if (value.length > 30) {
        return tr(context).nameMustBeAtMost30Letters;
      } else if (!checkPattern(pattern: patternName, value: value)) {
        return tr(context).pleaseEnterValidName;
      } else {
        return null;
      }
    };
  }

  /*FormFieldValidator<String?> validateEmptyField(BuildContext context) {
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

  FormFieldValidator<String?> validateSingleName(BuildContext context) {
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

  FormFieldValidator<String?> validateName(BuildContext context) {
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

  FormFieldValidator<String?> validateMobileNumber(BuildContext context) {
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

  FormFieldValidator<String?> validateEmail(BuildContext context) {
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

  FormFieldValidator<String?> validateIdNumber(BuildContext context) {
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

  FormFieldValidator<String?> validateCreatePassword(BuildContext context) {
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

  FormFieldValidator<String?> validatePositiveInteger(BuildContext context) {
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

  FormFieldValidator<String?> validateSponsorshipPartialAmount(
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
    const patternInteger = r'^-?[0-9]+$';
    return checkPattern(pattern: patternInteger, value: str);
  }

  static bool isNumericPositive(String str) {
    const patternPositiveInteger = r'^[1-9]\d*$';
    return checkPattern(pattern: patternPositiveInteger, value: str);
  }

  static bool checkPattern({required String pattern, required String value}) {
    final regularCheck = RegExp(pattern);
    return regularCheck.hasMatch(value);
  }
}
