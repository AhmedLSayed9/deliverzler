import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storageService = Provider<IStorageService>(
  (ref) => StorageService(),
);

enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

abstract class IStorageService {
  init();

  saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  });

  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  });

  Future<bool> clearAll();

  Future<bool> clearKey({required key});

  getSharedPrefsMethod({
    required bool restoring,
    required DataType sharedPrefsMethod,
  });
}

class StorageService implements IStorageService {
  late final bool hasHistory;
  late SharedPreferences _prefs;

  @override
  init() async {
    _prefs = await SharedPreferences.getInstance();
    //initHasHistory();
  }

  /*initHasHistory() async {
    hasHistory =
        await restoreData(key: 'has_history', dataType: DataType.bool) ?? false;
    log('hasHistory: ' + hasHistory.toString());
    if (!hasHistory){
      saveData(key: 'has_history', value: true, dataType: DataType.bool);
    }
  }*/

  @override
  saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  }) async {
    await getSharedPrefsMethod(
      restoring: false,
      sharedPrefsMethod: dataType,
    )(key, value);
  }

  @override
  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  }) async {
    return await getSharedPrefsMethod(
      restoring: true,
      sharedPrefsMethod: dataType,
    )(key);
  }

  @override
  Future<bool> clearAll() async {
    return await _prefs.clear();
  }

  @override
  Future<bool> clearKey({required key}) async {
    return await _prefs.remove(key);
  }

  @override
  getSharedPrefsMethod(
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
