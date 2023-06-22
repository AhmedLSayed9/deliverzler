import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

abstract class DateHelper {
  static String convertUTCToLocal(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMd(locale).add_jm().format(date);
  }

  static String convertEpochToLocal(BuildContext context, int date) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMd(locale).add_jm().format(
          DateTime.fromMillisecondsSinceEpoch(date).toLocal(),
        );
  }

  static DateTime convertEpochToLocalDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date).toLocal();
  }

  static int convertDateToUTCEpoch(DateTime date) {
    return date.toUtc().millisecondsSinceEpoch;
  }

  ////
  static String convertDateTimeToTime(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.jm(locale).format(dateTime);
  }

  static String convertDateTimeToDate(BuildContext context, DateTime dateTime) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMEd(locale).format(dateTime);
  }

  static String convertDateTimeToShortDate(
    BuildContext context,
    DateTime dateTime,
  ) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMMMd(locale).format(dateTime);
  }

  static String convertDateTimeToNumbersDate(
    BuildContext context,
    DateTime dateTime,
  ) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMd(locale).format(dateTime);
  }

  static String convertDateTimeToTimeAgo(
    BuildContext context,
    DateTime dateTime,
  ) {
    final locale = Localizations.localeOf(context).languageCode;
    return timeago.format(dateTime, locale: locale, allowFromNow: true);
  }

  static String getDifferenceInDays(BuildContext context, DateTime dateTime) {
    final currentDate = DateTime.now();
    return currentDate.difference(dateTime).inDays.toString();
  }

  static String getDifferenceInMonths(BuildContext context, DateTime dateTime) {
    final currentDate = DateTime.now();
    final diffInDays = currentDate.difference(dateTime).inDays;
    final diffInMonths = (diffInDays / 30).floor();
    return diffInMonths.toString();
  }

  static String convertNumberToTime(BuildContext context, double? number) {
    if (number == null || number < 0) return '00:00';
    final stringTime = convertNumberToStringTime(number);
    final stringDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return convertDateTimeToTime(
      context,
      DateTime.parse('$stringDate $stringTime'),
    );
  }

  static String convertNumberToStringTime(double number) {
    final flooredValue = number.floor();
    final hourValue = '$flooredValue'.padLeft(2, '0');
    final decimalValue = number - flooredValue;
    final minuteValue = '${(decimalValue * 60).toInt()}'.padLeft(2, '0');
    return '$hourValue:$minuteValue';
  }

  static DateTime? convertStringToLocalDateTime(String? dateTime) {
    if (dateTime == null) return null;
    return DateTime.tryParse(dateTime)?.toLocal();
  }
}
