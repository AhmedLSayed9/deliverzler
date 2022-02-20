import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateParser {
  DateParser._() {
    initializeDateFormatting();
  }

  static final instance = DateParser._();

  String convertUTCToLocal(DateTime date) {
    return DateFormat.yMMMd(tr(NavigationService.context).dateFormat).add_jm().format(date);
  }

  String convertEpochToLocal(int date) {
    return DateFormat.yMMMd(tr(NavigationService.context).dateFormat).add_jm().format(
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
