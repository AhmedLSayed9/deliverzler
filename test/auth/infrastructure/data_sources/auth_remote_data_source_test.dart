import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/sign_in_with_email.dart';
import 'package:deliverzler/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:deliverzler/auth/infrastructure/dtos/user_dto.dart';
import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/infrastructure/network/main_api/api_callers/firebase_auth_facade.dart';
import 'package:deliverzler/core/infrastructure/network/main_api/api_callers/firebase_firestore_facade.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../utils.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

class MockFirebaseAuthFacade extends Mock implements FirebaseAuthFacade {}

class MockFirebaseFirestoreFacade extends Mock
    implements FirebaseFirestoreFacade {}

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  late MockFirebaseAuthFacade mockFirebaseAuth;
  late MockFirebaseFirestoreFacade mockFirebaseFirestore;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  late MockDocumentSnapshot mockDocumentSnapshot;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuthFacade();
    mockFirebaseFirestore = MockFirebaseFirestoreFacade();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    mockDocumentSnapshot = MockDocumentSnapshot();
  });

  ProviderContainer setUpFirebaseContainer() {
    return setUpContainer(
      overrides: [
        firebaseAuthFacadeProvider.overrideWithValue(mockFirebaseAuth),
        firebaseFirestoreFacadeProvider
            .overrideWithValue(mockFirebaseFirestore),
      ],
    );
  }

  const tParams = SignInWithEmail(email: 'tEmail', password: 'tPassword');
  final tResponseMap = json.decode(fixtureReader('auth/user.json'));
  final tUserDto = UserDto.fromJson(tResponseMap);

  void setUpMockUser() {
    when(() => mockUser.uid).thenReturn(tUserDto.id);
    when(() => mockUser.email).thenReturn(tUserDto.email);
    when(() => mockUser.displayName).thenReturn(tUserDto.name);
    when(() => mockUser.phoneNumber).thenReturn(tUserDto.phone);
    when(() => mockUser.photoURL).thenReturn(tUserDto.image);
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
          when(() => mockFirebaseAuth.signInWithEmailAndPassword(
                email: any(named: 'email'),
                password: any(named: 'password'),
              )).thenAnswer((_) async => mockUserCredential);
          when(() => mockUserCredential.user).thenReturn(mockUser);
          setUpMockUser();

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.signInWithEmail(tParams);

          // THEN
          verifyOnly(
            mockFirebaseAuth,
            () => mockFirebaseAuth.signInWithEmailAndPassword(
              email: tParams.email,
              password: tParams.password,
            ),
          );
          expect(result, equals(tUserDto));
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
          when(() => mockFirebaseAuth.getCurrentUser())
              .thenAnswer((_) async => mockUser);
          setUpMockUser();

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.getUserAuthUid();

          // THEN
          verifyOnly(mockFirebaseAuth, () => mockFirebaseAuth.getCurrentUser());
          expect(result, equals(tUserDto.id));
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
          when(() => mockFirebaseFirestore.getData(path: any(named: 'path')))
              .thenAnswer((_) async => mockDocumentSnapshot);
          when(() => mockDocumentSnapshot.data()).thenReturn(tResponseMap);

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = await authRemoteDataSource.getUserData(tAuthUid);

          // THEN
          verifyOnly(mockFirebaseAuth,
              () => mockFirebaseFirestore.getData(path: tParam));
          expect(result, equals(tUserDto));
        },
      );
      test(
        'should throw a ServerException of type ServerExceptionType.notFound'
        'when the response is successful and data is null',
        () async {
          // GIVEN
          when(() => mockFirebaseFirestore.getData(path: any(named: 'path')))
              .thenAnswer((_) async => mockDocumentSnapshot);
          when(() => mockDocumentSnapshot.data()).thenReturn(null);

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          final result = authRemoteDataSource.getUserData(tAuthUid);

          // THEN
          verifyOnly(mockFirebaseAuth,
              () => mockFirebaseFirestore.getData(path: tParam));
          await expectLater(
            () => result,
            throwsA(
              isA<ServerException>().having(
                  (e) => e.type, 'type', equals(ServerExceptionType.notFound)),
            ),
          );
        },
      );
    },
  );

  group(
    'setUserData',
    () {
      final tPath = AuthRemoteDataSource.userDocPath(tUserDto.id);

      test(
        'should call FirebaseAuthCaller.setData with the proper params',
        () async {
          // GIVEN
          when(() => mockFirebaseFirestore.setData(
                path: any(named: 'path'),
                data: any(named: 'data'),
              )).thenAnswer((_) async {});

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          await authRemoteDataSource.setUserData(tUserDto);

          // THEN
          verifyOnly(
              mockFirebaseAuth,
              () => mockFirebaseFirestore.setData(
                    path: tPath,
                    data: tUserDto.toJson(),
                  ));
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
          when(() => mockFirebaseAuth.signOut()).thenAnswer((_) async {});

          final container = setUpFirebaseContainer();

          // WHEN
          final authRemoteDataSource =
              container.read(authRemoteDataSourceProvider);
          await authRemoteDataSource.signOut();

          // THEN
          verifyOnly(mockFirebaseAuth, () => mockFirebaseAuth.signOut());
        },
      );
    },
  );
}
