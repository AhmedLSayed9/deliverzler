import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/infrastructure/local/extensions/local_error_extension.dart';

void main() {
  group('localErrorToCacheException', () {
    const tErrorMessage = 'tError';

    test(
      'should return same error if error is CacheException and type is CacheExceptionType.general',
      () async {
        // GIVEN
        const tError = CacheException(type: CacheExceptionType.general, message: tErrorMessage);
        // WHEN
        final result = tError.localErrorToCacheException();
        // THEN
        expect(result, tError);
      },
    );

    test(
      'should return type CacheExceptionType.unknown with error.toString if error is random error',
      () async {
        // GIVEN
        final tError = Exception(tErrorMessage);
        // WHEN
        final result = tError.localErrorToCacheException();
        // THEN
        final expectedException = CacheException(
          type: CacheExceptionType.unknown,
          message: tError.toString(),
        );
        expect(result.type, expectedException.type);
        expect(result.message, expectedException.message);
        expect(result.code, expectedException.code);
      },
    );
  });
}
