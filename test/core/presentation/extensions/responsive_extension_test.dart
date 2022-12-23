import 'package:deliverzler/core/presentation/extensions/responsive_extension.dart';
import 'package:deliverzler/core/presentation/services/locator_service.dart';
import 'package:deliverzler/core/presentation/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'responsive_extension_test.mocks.dart';

@GenerateMocks([BuildContext, ResponsiveService])
void main() {
  late MockBuildContext mockBuildContext;
  late MockResponsiveService mockResponsiveService;

  setUpAll(() {
    mockBuildContext = MockBuildContext();
    mockResponsiveService = MockResponsiveService();
    getIt.registerSingleton<ResponsiveService>(mockResponsiveService);
  });

  tearDownAll(() {
    getIt.reset();
  });

  group('w', () {
    const double tScaleWidth = 11;
    const double tSize = 22;
    const double tScaledSize = tScaleWidth * tSize;
    test(
      'should return same result of (ResponsiveService.scaleWidth * size)',
      () {
        // GIVEN
        when(mockResponsiveService.scaleWidth(any))
            .thenAnswer((_) => tScaleWidth);
        // WHEN
        final result = tSize.w(mockBuildContext);
        // THEN
        verify(mockResponsiveService.scaleWidth(mockBuildContext));
        expect(result, tScaledSize);
        verifyNoMoreInteractions(mockResponsiveService);
      },
    );
  });

  group('h', () {
    const double tScaleHeight = 11;
    const double tSize = 22;
    const double tScaledSize = tScaleHeight * tSize;
    test(
      'should return same result of (ResponsiveService.scaleHeight * size)',
      () {
        // GIVEN
        when(mockResponsiveService.scaleHeight(any))
            .thenAnswer((_) => tScaleHeight);
        // WHEN
        final result = tSize.h(mockBuildContext);
        // THEN
        verify(mockResponsiveService.scaleHeight(mockBuildContext));
        expect(result, tScaledSize);
        verifyNoMoreInteractions(mockResponsiveService);
      },
    );
  });

  group('r', () {
    const double tScaleRadius = 11;
    const double tSize = 22;
    const double tScaledSize = tScaleRadius * tSize;
    test(
      'should return same result of (ResponsiveService.scaleRadius * size)',
      () {
        // GIVEN
        when(mockResponsiveService.scaleRadius(any))
            .thenAnswer((_) => tScaleRadius);
        // WHEN
        final result = tSize.r(mockBuildContext);
        // THEN
        verify(mockResponsiveService.scaleRadius(mockBuildContext));
        expect(result, tScaledSize);
        verifyNoMoreInteractions(mockResponsiveService);
      },
    );
  });

  group('sp', () {
    const double tScaleText = 11;
    const double tSize = 22;
    const double tScaledSize = tScaleText * tSize;
    test(
      'should return same result of (ResponsiveService.scaleText * size)',
      () {
        // GIVEN
        when(mockResponsiveService.scaleText(any))
            .thenAnswer((_) => tScaleText);
        // WHEN
        final result = tSize.sp(mockBuildContext);
        // THEN
        verify(mockResponsiveService.scaleText(mockBuildContext));
        expect(result, tScaledSize);
        verifyNoMoreInteractions(mockResponsiveService);
      },
    );
  });
}
