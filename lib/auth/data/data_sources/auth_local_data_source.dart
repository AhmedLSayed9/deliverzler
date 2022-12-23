import 'dart:convert';

import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/error/cache_exception_type.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IAuthLocalDataSource {
  /// Gets the cached data which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<void> cacheUserData(UserModel userModel);

  Future<UserModel> getUserData();

  Future<void> clearUserData();
}

final authLocalDataSourceProvider = Provider<IAuthLocalDataSource>(
  (ref) => AuthLocalDataSource(
    localStorageService: ref.watch(localStorageCallerProvider),
  ),
);

class AuthLocalDataSource implements IAuthLocalDataSource {
  AuthLocalDataSource({required this.localStorageService});

  final ILocalStorageCaller localStorageService;

  static const String userDataKey = 'user_data';

  @override
  Future<void> cacheUserData(UserModel userModel) async {
    final jsonString = json.encode(userModel.toMap());
    await localStorageService.saveData(
      key: userDataKey,
      dataType: DataType.string,
      value: jsonString,
    );
  }

  @override
  Future<UserModel> getUserData() async {
    final jsonString = await localStorageService.restoreData(
      key: userDataKey,
      dataType: DataType.string,
    );
    if (jsonString != null) {
      final userModel = UserModel.fromMap(json.decode(jsonString));
      return userModel;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  @override
  Future<void> clearUserData() async {
    await localStorageService.clearKey(
      key: userDataKey,
    );
  }
}
