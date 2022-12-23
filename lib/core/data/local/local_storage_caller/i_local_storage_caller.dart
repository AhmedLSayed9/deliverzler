enum DataType {
  string,
  int,
  double,
  bool,
  stringList,
}

abstract class ILocalStorageCaller {
  Future<bool> saveData({
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

  getSetMethod({required DataType sharedPrefsMethod});

  getGetMethod({required DataType sharedPrefsMethod});
}
