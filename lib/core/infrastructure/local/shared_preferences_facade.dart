import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/utils/riverpod_framework.dart';
import 'extensions/local_error_extension.dart';

part 'shared_preferences_facade.g.dart';

enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPrefsAsync(SharedPrefsAsyncRef ref) async {
  return await SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
SharedPreferences _sharedPrefs(_SharedPrefsRef ref) {
  return ref.watch(sharedPrefsAsyncProvider).requireValue;
}

@Riverpod(keepAlive: true)
SharedPreferencesFacade sharedPreferencesFacade(
    SharedPreferencesFacadeRef ref) {
  return SharedPreferencesFacade(
    sharedPrefs: ref.watch(_sharedPrefsProvider),
  );
}

class SharedPreferencesFacade {
  SharedPreferencesFacade({required this.sharedPrefs});

  final SharedPreferences sharedPrefs;

  /*
  late final bool hasHistory;
  initHasHistory() async {
    hasHistory =
        await restoreData(key: 'has_history', dataType: DataType.bool) ?? false;
    log('hasHistory: ' + hasHistory.toString());
    if (!hasHistory){
      saveData(key: 'has_history', value: true, dataType: DataType.bool);
    }
  }*/

  Future<bool> saveData({
    required String key,
    required dynamic value,
    required DataType dataType,
  }) async {
    return await _errorHandler(
      () async {
        return await getSetMethod(sharedPrefsMethod: dataType)(key, value);
      },
    );
  }

  Future<dynamic> restoreData({
    required String key,
    required DataType dataType,
  }) async {
    return await _errorHandler(
      () async {
        return await getGetMethod(sharedPrefsMethod: dataType)(key);
      },
    );
  }

  Future<bool> clearAll() async {
    return await _errorHandler(
      () async {
        return await sharedPrefs.clear();
      },
    );
  }

  Future<bool> clearKey({required key}) async {
    return await _errorHandler(
      () async {
        return await sharedPrefs.remove(key);
      },
    );
  }

  getSetMethod({required DataType sharedPrefsMethod}) {
    switch (sharedPrefsMethod) {
      case DataType.string:
        return sharedPrefs.setString;
      case DataType.int:
        return sharedPrefs.setInt;
      case DataType.double:
        return sharedPrefs.setDouble;
      case DataType.bool:
        return sharedPrefs.setBool;
      case DataType.stringList:
        return sharedPrefs.setStringList;
    }
  }

  getGetMethod({required DataType sharedPrefsMethod}) {
    switch (sharedPrefsMethod) {
      case DataType.string:
        return sharedPrefs.getString;
      case DataType.int:
        return sharedPrefs.getInt;
      case DataType.double:
        return sharedPrefs.getDouble;
      case DataType.bool:
        return sharedPrefs.getBool;
      case DataType.stringList:
        return sharedPrefs.getStringList;
    }
  }

  Future<T> _errorHandler<T>(Function body) async {
    try {
      return await body.call();
    } catch (e, st) {
      final error = e.localErrorToCacheException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}
