import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/auth/domain/sign_in_with_email.dart';
import 'package:deliverzler/core/domain/value_validators.dart';
import '../../utils.dart';

void main() {
  testWidgets(
    'should return same result of ValueValidators.validateEmail'
    'when SignInWithEmail.validateEmail is called',
    (WidgetTester tester) async {
      // GIVEN
      final context = await setUpLocalizationsContext(tester);
      const email = 'invalid_email';
      // WHEN
      final result = SignInWithEmail.validateEmail(context)(email);
      // THEN
      expect(result, 'Please enter a valid email address');
      expect(result, ValueValidators.validateEmail(context)(email));
    },
  );

  testWidgets(
    'should return same result of ValueValidators.validateLoginPassword'
    'when SignInWithEmail.validatePassword is called',
    (WidgetTester tester) async {
      // GIVEN
      final context = await setUpLocalizationsContext(tester);
      const pass = '';
      // WHEN
      final result = SignInWithEmail.validatePassword(context)(pass);
      // THEN
      expect(result, 'This field is empty');
      expect(result, ValueValidators.validateLoginPassword(context)(pass));
    },
  );
}
