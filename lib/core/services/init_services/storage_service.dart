import 'package:shared_preferences/shared_preferences.dart';

enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

class StorageService {
  StorageService._();

  static final instance = StorageService._();

  late final bool hasHistory;
  late SharedPreferences _prefs;

  initialize() async {
    _prefs = await SharedPreferences.getInstance();
    /*hasHistory = await restoreData(
      key: 'has_history',
      dataType: DataType.bool,
    ) ??
        false;
    debugPrint(hasHistory.toString());
    debugPrint("hasHistory");
    if (!hasHistory) _setHistory();*/
  }

  /*_setHistory() async {
    saveData(key: 'has_history', value: true, dataType: DataType.bool);
  }*/

  saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  }) async {
    await _getSharedPrefsMethod(
      restoring: false,
      sharedPrefsMethod: dataType,
    )(key, value);
  }

  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  }) async {
    return await _getSharedPrefsMethod(
      restoring: true,
      sharedPrefsMethod: dataType,
    )(key);
  }

  Future<bool> clearAll() async {
    return await _prefs.clear();
  }

  Future<bool> clearKey({required key}) async {
    return await _prefs.remove(key);
  }

  _getSharedPrefsMethod(
      {required bool restoring, required DataType sharedPrefsMethod}) {
    switch (sharedPrefsMethod) {
      case DataType.bool:
        {
          return restoring ? _prefs.getBool : _prefs.setBool;
        }
      case DataType.string:
        {
          return restoring ? _prefs.getString : _prefs.setString;
        }
      case DataType.double:
        {
          return restoring ? _prefs.getBool : _prefs.setBool;
        }
      case DataType.int:
        {
          return restoring ? _prefs.getInt : _prefs.setInt;
        }
      case DataType.stringList:
        {
          return restoring ? _prefs.getStringList : _prefs.setStringList;
        }
      default:
        {
          throw 'No method was selected, method is required';
        }
    }
  }
}
