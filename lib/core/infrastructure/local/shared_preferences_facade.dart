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
  return SharedPreferences.getInstance();
}

@Riverpod(keepAlive: true)
SharedPreferences _sharedPrefs(_SharedPrefsRef ref) {
  return ref.watch(sharedPrefsAsyncProvider).requireValue;
}

@Riverpod(keepAlive: true)
SharedPreferencesFacade sharedPreferencesFacade(SharedPreferencesFacadeRef ref) {
  return SharedPreferencesFacade(
    sharedPrefs: ref.watch(_sharedPrefsProvider),
  );
}

class SharedPreferencesFacade {
  SharedPreferencesFacade({required this.sharedPrefs});

  final SharedPreferences sharedPrefs;

  Future<bool> saveData({
    required DataType dataType,
    required String key,
    required Object value,
  }) async {
    return _errorHandler(
      () async {
        switch (dataType) {
          case DataType.string:
            return sharedPrefs.setString(key, value as String);
          case DataType.int:
            return sharedPrefs.setInt(key, value as int);
          case DataType.double:
            return sharedPrefs.setDouble(key, value as double);
          case DataType.bool:
            return sharedPrefs.setBool(key, value as bool);
          case DataType.stringList:
            return sharedPrefs.setStringList(key, value as List<String>);
        }
      },
    );
  }

  FutureOr<T?> restoreData<T>({
    required DataType dataType,
    required String key,
  }) {
    return _errorHandler(
      () {
        switch (dataType) {
          case DataType.string:
            return sharedPrefs.getString(key) as T?;
          case DataType.int:
            return sharedPrefs.getInt(key) as T?;
          case DataType.double:
            return sharedPrefs.getDouble(key) as T?;
          case DataType.bool:
            return sharedPrefs.getBool(key) as T?;
          case DataType.stringList:
            return sharedPrefs.getStringList(key) as T?;
        }
      },
    );
  }

  Future<bool> clearAll() async {
    return _errorHandler(
      () async {
        return sharedPrefs.clear();
      },
    );
  }

  Future<bool> clearKey({required String key}) async {
    return _errorHandler(
      () async {
        return sharedPrefs.remove(key);
      },
    );
  }

  FutureOr<T> _errorHandler<T>(FutureOr<T> Function() body) async {
    try {
      return await body.call();
    } catch (e, st) {
      final error = e.localErrorToCacheException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}
