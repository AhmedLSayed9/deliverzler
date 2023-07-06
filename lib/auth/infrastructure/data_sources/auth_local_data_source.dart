import 'dart:convert';

import '../../../core/infrastructure/error/app_exception.dart';
import '../../../core/infrastructure/local/shared_preferences_facade.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../dtos/user_dto.dart';

part 'auth_local_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthLocalDataSource authLocalDataSource(AuthLocalDataSourceRef ref) {
  return AuthLocalDataSource(
    sharedPreferences: ref.watch(sharedPreferencesFacadeProvider),
  );
}

class AuthLocalDataSource {
  AuthLocalDataSource({required this.sharedPreferences});

  final SharedPreferencesFacade sharedPreferences;

  static const String userDataKey = 'user_data';

  Future<void> cacheUserData(UserDto userDto) async {
    final jsonString = json.encode(userDto.toJson());
    await sharedPreferences.saveData(
      key: userDataKey,
      value: jsonString,
    );
  }

  UserDto getUserData() {
    final jsonString = sharedPreferences.restoreData<String>(userDataKey);
    if (jsonString != null) {
      final userDto = UserDto.fromJson(json.decode(jsonString) as Map<String, dynamic>);
      return userDto;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  Future<void> clearUserData() async {
    await sharedPreferences.clearKey(
      key: userDataKey,
    );
  }
}
