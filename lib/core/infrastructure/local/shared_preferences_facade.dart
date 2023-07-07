import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/utils/riverpod_framework.dart';
import 'extensions/local_error_extension.dart';

part 'shared_preferences_facade.g.dart';

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
    required String key,
    required Object value,
  }) async {
    return _futureErrorHandler(
      () async {
        return switch (value) {
          final String value => sharedPrefs.setString(key, value),
          final int value => sharedPrefs.setInt(key, value),
          final double value => sharedPrefs.setDouble(key, value),
          final bool value => sharedPrefs.setBool(key, value),
          final List<String> value => sharedPrefs.setStringList(key, value),
          _ => throw UnsupportedError(
              'The type of this value is not supported. '
              'All supported types are: String | int | double | bool | List<String>.',
            ),
        };
      },
    );
  }

  T? restoreData<T>(String key) {
    return _errorHandler(
      () {
        return switch (T) {
          String => sharedPrefs.getString(key) as T?,
          int => sharedPrefs.getInt(key) as T?,
          double => sharedPrefs.getDouble(key) as T?,
          bool => sharedPrefs.getBool(key) as T?,
          const (List<String>) => sharedPrefs.getStringList(key) as T?,
          _ => throw UnsupportedError(
              'The generic type is not supported. '
              'All supported types are: String | int | double | bool | List<String>.',
            ),
        };
      },
    );
  }

  Future<bool> clearAll() async {
    return _futureErrorHandler(
      () async {
        return sharedPrefs.clear();
      },
    );
  }

  Future<bool> clearKey({required String key}) async {
    return _futureErrorHandler(
      () async {
        return sharedPrefs.remove(key);
      },
    );
  }

  T _errorHandler<T>(T Function() body) {
    try {
      return body.call();
    } catch (e, st) {
      final error = e.localErrorToCacheException();
      throw Error.throwWithStackTrace(error, st);
    }
  }

  Future<T> _futureErrorHandler<T>(Future<T> Function() body) async {
    try {
      return await body.call();
    } catch (e, st) {
      final error = e.localErrorToCacheException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}
