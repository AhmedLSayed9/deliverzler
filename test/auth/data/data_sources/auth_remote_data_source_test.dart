import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/network/i_firebase_auth_caller.dart';
import 'package:deliverzler/core/data/network/i_firebase_firestore_caller.dart';
import 'package:deliverzler/core/data/network/main_api/api_callers/main_api_auth_caller.dart';
import 'package:deliverzler/core/data/network/main_api/api_callers/main_api_firestore_caller.dart';
import '../../../fixtures/fixture_reader.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockIFirebaseAuthCaller extends Mock implements IFirebaseAuthCaller {}

class MockIFirebaseFirestoreCaller extends Mock
    implements IFirebaseFirestoreCaller {}

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  late MockIFirebaseAuthCaller mockIFirebaseAuthCaller;
  late MockIFirebaseFirestoreCaller mockIFirebaseFirestoreCaller;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockIFirebaseAuthCaller = MockIFirebaseAuthCaller();
    mockIFirebaseFirestoreCaller = MockIFirebaseFirestoreCaller();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        mainApiAuthCallerProvider.overrideWithValue(mockIFirebaseAuthCaller),
        mainApiFirestoreCallerProvider
            .overrideWithValue(mockIFirebaseFirestoreCaller),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tParams = SignInWithEmailParams(email: 'tEmail', password: 'tPassword');
  final tResponseMap = json.decode(fixtureReader('auth/user.json'));
  final tUserModel = UserModel.fromJson(tResponseMap);

  void setUpMockUser() {
    when(() => mockUser.uid).thenReturn(tUserModel.id);
    when(() => mockUser.email).thenReturn(tUserModel.email);
    when(() => mockUser.displayName).thenReturn(tUserModel.name);
    when(() => mockUser.phoneNumber).thenReturn(tUserModel.phone);
    when(() => mockUser.photoURL).thenReturn(tUserModel.image);
  }

  group(
    'signInWithEmail',
    () {
      test(
        'should call FirebaseAuthCaller.signInWithEmailAndPassword and return the proper remote data'
        'when the response is successful',
        () async {
          // GIVEN
          //This is just necessary to assure we return a working value not null value
          //so the signInWithEmail method continue without throwing exceptions
          when(() => mockIFirebaseAuthCaller.signInWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => mockUserCredential);
          when(() => mockUserCredential.user).thenReturn(mockUser);
          setUpMockUser();

          final container = setUpContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.signInWithEmail(tParams);

          // THEN
          verify(
            () => mockIFirebaseAuthCaller.signInWithEmailAndPassword(
              email: tParams.email,
              password: tParams.password,
            ),
          ).called(1);
          expect(result, equals(tUserModel));
          verifyNoMoreInteractions(mockIFirebaseAuthCaller);
        },
      );
      //Testing of throwing ServerException when the response is unsuccessful
      //is already done at the firebaseAuthCaller test
    },
  );

  group(
    'getUserAuthUid',
    () {
      test(
        'should call FirebaseAuthCaller.getCurrentUser and return the proper remote data'
        'when the response is successful',
        () async {
          // GIVEN
          when(() => mockIFirebaseAuthCaller.getCurrentUser())
              .thenAnswer((_) async => mockUser);
          setUpMockUser();

          final container = setUpContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.getUserAuthUid();

          // THEN
          verify(() => mockIFirebaseAuthCaller.getCurrentUser()).called(1);
          expect(result, equals(tUserModel.id));
          verifyNoMoreInteractions(mockIFirebaseAuthCaller);
        },
      );
    },
  );

  group(
    'getUserData',
    () {
      const tAuthUid = 'uid';
      final tParam = AuthRemoteDataSource.userDocPath(tAuthUid);

      test(
        'should call FirebaseFirestoreCaller.getData and return the proper remote data'
        'when the response is successful and data is not null',
        () async {
          // GIVEN
          when(() => mockIFirebaseFirestoreCaller.getData(
                  path: any(named: 'path')))
              .thenAnswer((_) async => mockDocumentSnapshot);
          when(() => mockDocumentSnapshot.data()).thenReturn(tResponseMap);

          final container = setUpContainer();
          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.getUserData(tAuthUid);

          // THEN
          verify(() => mockIFirebaseFirestoreCaller.getData(path: tParam))
              .called(1);
          expect(result, equals(tUserModel));
          verifyNoMoreInteractions(mockIFirebaseFirestoreCaller);
        },
      );
      test(
        'should throw a ServerException of type ServerExceptionType.notFound'
        'when the response is successful and data is null',
        () async {
          // GIVEN
          when(() => mockIFirebaseFirestoreCaller.getData(
                  path: any(named: 'path')))
              .thenAnswer((_) async => mockDocumentSnapshot);
          when(() => mockDocumentSnapshot.data()).thenReturn(null);

          final container = setUpContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = authRemoteDataSource.getUserData(tAuthUid);

          // THEN
          verify(() => mockIFirebaseFirestoreCaller.getData(path: tParam))
              .called(1);
          await expectLater(
            () => result,
            throwsA(
              isA<ServerException>().having(
                  (e) => e.type, 'type', equals(ServerExceptionType.notFound)),
            ),
          );
          verifyNoMoreInteractions(mockIFirebaseFirestoreCaller);
        },
      );
    },
  );

  group(
    'setUserData',
    () {
      final tPath = AuthRemoteDataSource.userDocPath(tUserModel.id);

      test(
        'should call FirebaseAuthCaller.setData with the proper params',
        () async {
          // GIVEN
          when(() => mockIFirebaseFirestoreCaller.setData(
                path: any(named: 'path'),
                data: any(named: 'data'),
              )).thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          await authRemoteDataSource.setUserData(tUserModel);

          // THEN
          verify(() => mockIFirebaseFirestoreCaller.setData(
                path: tPath,
                data: tUserModel.toJson(),
              )).called(1);
          verifyNoMoreInteractions(mockIFirebaseFirestoreCaller);
        },
      );
    },
  );

  group(
    'signOut',
    () {
      test(
        'should call FirebaseAuthCaller.signOut',
        () async {
          // GIVEN
          final container = setUpContainer();
          when(() => mockIFirebaseAuthCaller.signOut())
              .thenAnswer((_) async => Future.value());

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          await authRemoteDataSource.signOut();

          // THEN
          verify(() => mockIFirebaseAuthCaller.signOut()).called(1);
          verifyNoMoreInteractions(mockIFirebaseAuthCaller);
        },
      );
    },
  );
}
