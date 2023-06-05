import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/infrastructure/local/extensions/local_error_extension.dart';

void main() {
  group('localErrorToCacheException', () {
    const tErrorMessage = 'tError';

    test(
      'should return type CacheExceptionType.general with error.toString',
      () async {
        // GIVEN
        final tError = Exception(tErrorMessage);
        // WHEN
        final result = tError.localErrorToCacheException();
        // THEN
        final expectedException = CacheException(
          type: CacheExceptionType.general,
          message: tError.toString(),
        );
        expect(result.type, expectedException.type);
        expect(result.message, expectedException.message);
        expect(result.code, expectedException.code);
      },
    );
  });
}
