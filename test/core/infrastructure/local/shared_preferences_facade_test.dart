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

  final tError = UnimplementedError('error');

  group('saveData', () {
    test(
      'should call SharedPreferences.setString with the proper params when value is String',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setString(tKey, tStringValue))
            .thenAnswer((_) async => tResponse);

        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tStringValue,
        );

        // THEN
        verify(() => mockSharedPrefs.setString(tKey, tStringValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setInt with the proper params when value is int',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setInt(tKey, tIntValue)).thenAnswer((_) async => tResponse);

        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tIntValue,
        );

        // THEN
        verify(() => mockSharedPrefs.setInt(tKey, tIntValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setDouble with the proper params when value is double',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setDouble(tKey, tDoubleValue))
            .thenAnswer((_) async => tResponse);

        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tDoubleValue,
        );

        // THEN
        verify(() => mockSharedPrefs.setDouble(tKey, tDoubleValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setBool with the proper params when value is bool',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setBool(tKey, tBoolValue)).thenAnswer((_) async => tResponse);

        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tBoolValue,
        );

        // THEN
        verify(() => mockSharedPrefs.setBool(tKey, tBoolValue)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should call SharedPreferences.setStringList with the proper params when value is List<String>',
      () async {
        // GIVEN
        const tResponse = true;
        when(() => mockSharedPrefs.setStringList(tKey, tStringList))
            .thenAnswer((_) async => tResponse);

        // WHEN
        final result = await sharedPrefsFacade.saveData(
          key: tKey,
          value: tStringList,
        );

        // THEN
        verify(() => mockSharedPrefs.setStringList(tKey, tStringList)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    //No need to test for other value types
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

    test(
      'should throw UnsupportedError when value is not supported',
      () async {
        // GIVEN
        final value = [1, 2, 3];

        // WHEN
        final call = sharedPrefsFacade.saveData(
          key: tKey,
          value: value,
        );
        // THEN
        await expectLater(
          () => call,
          throwsException,
        );
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );
  });

  group('restoreData', () {
    test(
      'should return same result from SharedPreferences.getString when the generic type is String',
      () async {
        // GIVEN
        const tResponse = tStringValue;
        when(() => mockSharedPrefs.getString(tKey)).thenReturn(tResponse);

        // WHEN
        final result = sharedPrefsFacade.restoreData<String>(tKey);

        // THEN
        verify(() => mockSharedPrefs.getString(tKey)).called(1);
        expect(result, tResponse);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getInt when the generic type is int',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getInt(tKey)).thenReturn(tIntValue);

        // WHEN
        final result = sharedPrefsFacade.restoreData<int>(tKey);

        // THEN
        verify(() => mockSharedPrefs.getInt(tKey)).called(1);
        expect(result, tIntValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getDouble when the generic type is double',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getDouble(tKey)).thenReturn(tDoubleValue);

        // WHEN
        final result = sharedPrefsFacade.restoreData<double>(tKey);

        // THEN
        verify(() => mockSharedPrefs.getDouble(tKey)).called(1);
        expect(result, tDoubleValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getBool when the generic type is bool',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getBool(tKey)).thenReturn(tBoolValue);

        // WHEN
        final result = sharedPrefsFacade.restoreData<bool>(tKey);

        // THEN
        verify(() => mockSharedPrefs.getBool(tKey)).called(1);
        expect(result, tBoolValue);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should return same result from SharedPreferences.getStringList when the generic type is List<String>',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getStringList(tKey)).thenReturn(tStringList);

        // WHEN
        final result = sharedPrefsFacade.restoreData<List<String>>(tKey);

        // THEN
        verify(() => mockSharedPrefs.getStringList(tKey)).called(1);
        expect(result, tStringList);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    //No need to test for other value types
    test(
      'should throw error.localErrorToCacheException '
      'when the call to SharedPreferences.getString is unsuccessful',
      () async {
        // GIVEN
        when(() => mockSharedPrefs.getString(tKey)).thenThrow(tError);

        // THEN
        expect(
          () => sharedPrefsFacade.restoreData<String>(tKey),
          throwsA(tError.localErrorToCacheException()),
        );
        verify(() => mockSharedPrefs.getString(tKey)).called(1);
        verifyNoMoreInteractions(mockSharedPrefs);
      },
    );

    test(
      'should throw UnsupportedError when the generic value is not supported',
      () async {
        expect(
          () => sharedPrefsFacade.restoreData<List<int>>(tKey),
          throwsException,
        );
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
