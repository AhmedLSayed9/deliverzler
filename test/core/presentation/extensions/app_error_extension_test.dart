import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import '../../../utils.dart';

void main() {
  group('message', () {
    const tMessage = 'tMessage';

    testWidgets(
      'should return same error message '
      'when AppException is CacheException and type is CacheExceptionType.general',
      (WidgetTester tester) async {
        // GIVEN
        final context = await setUpLocalizationsContext(tester);
        const AppException tException = CacheException(
          type: CacheExceptionType.general,
          message: 'error',
        );
        // WHEN
        final result = tException.errorMessage(context);
        // THEN
        expect(result, tException.message);
      },
    );

    testWidgets(
      'should return same result of tr(context).unknownError '
      'when AppException is CacheException and type is CacheExceptionType.unknown',
      (WidgetTester tester) async {
        // GIVEN
        final context = await setUpLocalizationsContext(tester);
        const AppException tException = CacheException(
          type: CacheExceptionType.unknown,
          message: 'error',
        );
        // WHEN
        final result = tException.errorMessage(context);
        // THEN
        expect(result, tr(context).unknownError);
      },
    );

    void runServerExceptionTest({
      required BuildContext context,
      required ServerExceptionType type,
      required String expectedResult,
    }) {
      // GIVEN
      final AppException tException = ServerException(
        type: type,
        message: tMessage,
      );
      // WHEN
      final result = tException.errorMessage(context);
      // THEN
      expect(result, expectedResult);
    }

    testWidgets(
      'should return same message from server '
      'when AppException is ServerException and type is general',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.general,
          expectedResult: tMessage,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).unauthorizedError '
      'when AppException is ServerException and type is unauthorized',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.unauthorized,
          expectedResult: tr(context).unauthorizedError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).forbiddenError '
      'when AppException is ServerException and type is forbidden',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.forbidden,
          expectedResult: tr(context).forbiddenError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).notFoundError '
      'when AppException is ServerException and type is notFound',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.notFound,
          expectedResult: tr(context).notFoundError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).conflictError '
      'when AppException is ServerException and type is conflict',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.conflict,
          expectedResult: tr(context).conflictError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).internalServerError '
      'when AppException is ServerException and type is internal',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.internal,
          expectedResult: tr(context).internalError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).serviceUnavailableError '
      'when AppException is ServerException and type is serviceUnavailable',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.serviceUnavailable,
          expectedResult: tr(context).serviceUnavailableError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).timeoutError '
      'when AppException is ServerException and type is timeOut',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.timeOut,
          expectedResult: tr(context).timeoutError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).noInternetError '
      'when AppException is ServerException and type is noInternet',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.noInternet,
          expectedResult: tr(context).noInternetError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).unknownError '
      'when AppException is ServerException and type is unknown',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.unknown,
          expectedResult: tr(context).unknownError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).authInvalidEmailError '
      'when AppException is ServerException and type is authInvalidEmail',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.authInvalidEmail,
          expectedResult: tr(context).authInvalidEmailError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).authWrongPasswordError '
      'when AppException is ServerException and type is authWrongPassword',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.authWrongPassword,
          expectedResult: tr(context).authWrongPasswordError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).authUserNotFoundError '
      'when AppException is ServerException and type is authUserNotFound',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.authUserNotFound,
          expectedResult: tr(context).authUserNotFoundError,
        );
      },
    );

    testWidgets(
      'should return same result of tr(context).authUserDisabledError '
      'when AppException is ServerException and type is authUserDisabled',
      (WidgetTester tester) async {
        final context = await setUpLocalizationsContext(tester);
        runServerExceptionTest(
          context: context,
          type: ServerExceptionType.authUserDisabled,
          expectedResult: tr(context).authUserDisabledError,
        );
      },
    );
  });
}
