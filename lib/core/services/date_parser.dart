import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateParser {
  DateParser._() {
    initializeDateFormatting();
  }

  static final instance = DateParser._();

  String convertUTCToLocal(BuildContext context, DateTime date) {
    final String _locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMd(_locale).add_jm().format(date);
  }

  String convertEpochToLocal(BuildContext context, int date) {
    final String _locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMd(_locale).add_jm().format(
          DateTime.fromMillisecondsSinceEpoch(date).toLocal(),
        );
  }

  DateTime convertEpochToLocalDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date).toLocal();
  }

  int convertDateToUTCEpoch(DateTime date) {
    return date.toUtc().millisecondsSinceEpoch;
  }
}
