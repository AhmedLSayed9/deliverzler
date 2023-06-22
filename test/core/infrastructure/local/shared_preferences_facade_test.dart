import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:deliverzler/core/infrastructure/local/extensions/local_error_extension.dart';
import 'package:deliverzler/core/infrastructure/local/shared_preferences_facade.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPrefs;
  late SharedPreferencesFacade sharedPrefsFacade;

  setUp(() {
    mockSharedPrefs = MockSharedPreferences();
    sharedPrefsFacade = SharedPreferencesFacade(sharedPrefs: mockSharedPrefs);
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
        when(() => mockSharedPrefs.setString(tKey, tStringValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tStringValue,
          dataType: DataType.string,
        );
        // THEN
        verify(() => mockSharedPrefs.setString(tKey, tStringValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setInt with the proper params when dataType is DataType.int',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setInt(tKey, tIntValue)).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tIntValue,
          dataType: DataType.int,
        );
        // THEN
        verify(() => mockSharedPrefs.setInt(tKey, tIntValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setDouble with the proper params when dataType is DataType.double',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setDouble(tKey, tDoubleValue))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tDoubleValue,
          dataType: DataType.double,
        );
        // THEN
        verify(() => mockSharedPrefs.setDouble(tKey, tDoubleValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setBool with the proper params when dataType is DataType.bool',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setBool(tKey, tBoolValue)).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tBoolValue,
          dataType: DataType.bool,
        );
        // THEN
        verify(() => mockSharedPrefs.setBool(tKey, tBoolValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setStringList with the proper params when dataType is DataType.stringList',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setStringList(tKey, tStringList))
            .thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tStringList,
          dataType: DataType.stringList,
        );
        // THEN
        verify(() => mockSharedPrefs.setStringList(tKey, tStringList)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    //No need to test for all DataTypes
    test(
      'should throw error.localErrorToCacheException '
      'when the call to SharedPreferences.setString is unsuccessful',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.setString(tKey, tStringValue)).thenThrow(tError);
        // WHEN
        final call = sharedPrefsFacade.saveData(
          key: tKey,
          value: tStringValue,
          dataType: DataType.string,
        );
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(() => mockSharedPrefs.setString(tKey, tStringValue)).called(1);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );
  });

  group('restoreData', () {
    test(
      'should return same result from SharedPreferences.getString when dataType is DataType.string',
      () async {
        // GIVEN
        const tResponse = tStringValue;
        when(() => mockSharedPrefs.getString(tKey)).thenAnswer((_) => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.restoreData<String>(
          key: tKey,
          dataType: DataType.string,
        );
        // THEN
        verify(() => mockSharedPrefs.getString(tKey)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getInt when dataType is DataType.int',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getInt(tKey)).thenAnswer((_) => tIntValue);
        // WHEN
        final result = await sharedPrefsFacade.restoreData<int>(
          key: tKey,
          dataType: DataType.int,
        );
        // THEN
        verify(() => mockSharedPrefs.getInt(tKey)).called(1);
        expect(result, tIntValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getDouble when dataType is DataType.double',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getDouble(tKey)).thenAnswer((_) => tDoubleValue);
        // WHEN
        final result = await sharedPrefsFacade.restoreData<double>(
          key: tKey,
          dataType: DataType.double,
        );
        // THEN
        verify(() => mockSharedPrefs.getDouble(tKey)).called(1);
        expect(result, tDoubleValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getBool when dataType is DataType.bool',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getBool(tKey)).thenAnswer((_) => tBoolValue);
        // WHEN
        final result = await sharedPrefsFacade.restoreData<bool>(
          key: tKey,
          dataType: DataType.bool,
        );
        // THEN
        verify(() => mockSharedPrefs.getBool(tKey)).called(1);
        expect(result, tBoolValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getStringList when dataType is DataType.stringList',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getStringList(tKey)).thenAnswer((_) => tStringList);
        // WHEN
        final result = await sharedPrefsFacade.restoreData<List<String>>(
          key: tKey,
          dataType: DataType.stringList,
        );
        // THEN
        verify(() => mockSharedPrefs.getStringList(tKey)).called(1);
        expect(result, tStringList);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    //No need to test for all DataTypes
    test(
      'should throw error.localErrorToCacheException '
      'when the call to SharedPreferences.getString is unsuccessful',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getString(tKey)).thenThrow(tError);
        // WHEN
        final call = sharedPrefsFacade.restoreData<String>(
          key: tKey,
          dataType: DataType.string,
        );
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(() => mockSharedPrefs.getString(tKey)).called(1);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );
  });

  group('clearAll', () {
    test(
      'should call SharedPreferences.clear',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.clear()).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.clearAll();
        // THEN
        verify(() => mockSharedPrefs.clear()).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should throw error.localErrorToCacheException '
      'when the call to SharedPreferences.clear is unsuccessful',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.clear()).thenThrow(tError);
        // WHEN
        final call = sharedPrefsFacade.clearAll();
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(() => mockSharedPrefs.clear()).called(1);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );
  });

  group('clearKey', () {
    test(
      'should call SharedPreferences.remove with the proper key',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.remove(tKey)).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await sharedPrefsFacade.clearKey(key: tKey);
        // THEN
        verify(() => mockSharedPrefs.remove(tKey)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should throw error.localErrorToCacheException '
      'when the call to SharedPreferences.remove is unsuccessful',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.remove(tKey)).thenThrow(tError);
        // WHEN
        final call = sharedPrefsFacade.clearKey(key: tKey);
        // THEN
        await expectLater(
          () => call,
          throwsA(tError.localErrorToCacheException()),
        );
        verify(() => mockSharedPrefs.remove(tKey)).called(1);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );
  });
}
