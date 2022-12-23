import 'package:deliverzler/core/data/local/extensions/local_error_extension.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_local_storage_caller_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late SharedPrefsLocalStorageCaller sharedPrefCaller;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    sharedPrefCaller =
        SharedPrefsLocalStorageCaller(sharedPreferences: mockSharedPreferences);
  });

  const tKey = 'tKey';
  const tStringValue = 'tValue';
  const tIntValue = 1;
  const tDoubleValue = 1.0;
  const tBoolValue = true;
  const tStringList = ['t1', 't2'];

  const tError = FormatException('error');

  group('saveData', () {
    test(
      'should call SharedPreferences.setString with the proper params when dataType is DataType.string',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.setString(tKey, tStringValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.saveData(
          key: tKey,
          value: tStringValue,
          dataType: DataType.string,
        );
        // THEN
        verify(mockSharedPreferences.setString(tKey, tStringValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should call SharedPreferences.setInt with the proper params when dataType is DataType.int',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.setInt(tKey, tIntValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.saveData(
          key: tKey,
          value: tIntValue,
          dataType: DataType.int,
        );
        // THEN
        verify(mockSharedPreferences.setInt(tKey, tIntValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should call SharedPreferences.setDouble with the proper params when dataType is DataType.double',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.setDouble(tKey, tDoubleValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.saveData(
          key: tKey,
          value: tDoubleValue,
          dataType: DataType.double,
        );
        // THEN
        verify(mockSharedPreferences.setDouble(tKey, tDoubleValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should call SharedPreferences.setBool with the proper params when dataType is DataType.bool',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.setBool(tKey, tBoolValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.saveData(
          key: tKey,
          value: tBoolValue,
          dataType: DataType.bool,
        );
        // THEN
        verify(mockSharedPreferences.setBool(tKey, tBoolValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should call SharedPreferences.setStringList with the proper params when dataType is DataType.stringList',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.setStringList(tKey, tStringList))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.saveData(
          key: tKey,
          value: tStringList,
          dataType: DataType.stringList,
        );
        // THEN
        verify(mockSharedPreferences.setStringList(tKey, tStringList))
            .called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    //No need to test for all DataTypes
    test(
      'should throw error.localErrorToCacheException'
      'when the call to SharedPreferences.setString is unsuccessful',
      () async {
        // GIVEN
        when(mockSharedPreferences.setString(tKey, tStringValue))
            .thenThrow(tError);
        // WHEN
        final call = sharedPrefCaller.saveData(
          key: tKey,
          value: tStringValue,
          dataType: DataType.string,
        );
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(mockSharedPreferences.setString(tKey, tStringValue)).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('restoreData', () {
    test(
      'should return same result from SharedPreferences.getString when dataType is DataType.string',
      () async {
        // GIVEN
        const tResponse = tStringValue;
        when(mockSharedPreferences.getString(tKey))
            .thenAnswer((_) => tResponse);
        // WHEN
        final result = await sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.string,
        );
        // THEN
        verify(mockSharedPreferences.getString(tKey)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return same result from SharedPreferences.getInt when dataType is DataType.int',
      () async {
        // GIVEN
        when(mockSharedPreferences.getInt(tKey)).thenAnswer((_) => tIntValue);
        // WHEN
        final result = await sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.int,
        );
        // THEN
        verify(mockSharedPreferences.getInt(tKey)).called(1);
        expect(result, tIntValue);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return same result from SharedPreferences.getDouble when dataType is DataType.double',
      () async {
        // GIVEN
        when(mockSharedPreferences.getDouble(tKey))
            .thenAnswer((_) => tDoubleValue);
        // WHEN
        final result = await sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.double,
        );
        // THEN
        verify(mockSharedPreferences.getDouble(tKey)).called(1);
        expect(result, tDoubleValue);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return same result from SharedPreferences.getBool when dataType is DataType.bool',
      () async {
        // GIVEN
        when(mockSharedPreferences.getBool(tKey)).thenAnswer((_) => tBoolValue);
        // WHEN
        final result = await sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.bool,
        );
        // THEN
        verify(mockSharedPreferences.getBool(tKey)).called(1);
        expect(result, tBoolValue);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return same result from SharedPreferences.getStringList when dataType is DataType.stringList',
      () async {
        // GIVEN
        when(mockSharedPreferences.getStringList(tKey))
            .thenAnswer((_) => tStringList);
        // WHEN
        final result = await sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.stringList,
        );
        // THEN
        verify(mockSharedPreferences.getStringList(tKey)).called(1);
        expect(result, tStringList);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    //No need to test for all DataTypes
    test(
      'should throw error.localErrorToCacheException'
      'when the call to SharedPreferences.getString is unsuccessful',
      () async {
        // GIVEN
        when(mockSharedPreferences.getString(tKey)).thenThrow(tError);
        // WHEN
        final call = sharedPrefCaller.restoreData(
          key: tKey,
          dataType: DataType.string,
        );
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(mockSharedPreferences.getString(tKey)).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('clearAll', () {
    test(
      'should call SharedPreferences.clear',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.clear()).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.clearAll();
        // THEN
        verify(mockSharedPreferences.clear()).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should throw error.localErrorToCacheException'
      'when the call to SharedPreferences.clear is unsuccessful',
      () async {
        // GIVEN
        when(mockSharedPreferences.clear()).thenThrow(tError);
        // WHEN
        final call = sharedPrefCaller.clearAll();
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(mockSharedPreferences.clear()).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

  group('clearKey', () {
    test(
      'should call SharedPreferences.remove with the proper key',
      () async {
        // GIVEN
        const tResponse = true;
        when(mockSharedPreferences.remove(tKey))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefCaller.clearKey(key: tKey);
        // THEN
        verify(mockSharedPreferences.remove(tKey)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should throw error.localErrorToCacheException'
      'when the call to SharedPreferences.remove is unsuccessful',
      () async {
        // GIVEN
        when(mockSharedPreferences.remove(tKey)).thenThrow(tError);
        // WHEN
        final call = sharedPrefCaller.clearKey(key: tKey);
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(mockSharedPreferences.remove(tKey)).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });
}
