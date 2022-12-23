import 'dart:math';

import 'package:deliverzler/core/presentation/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'responsive_service_test.mocks.dart';

@GenerateMocks([BuildContext, MediaQueryData])
void main() {
  late MockMediaQueryData mockFlutterWindowMediaQuery;
  late MockBuildContext mockBuildContext;
  late MockMediaQueryData mockMediaQueryData;
  late MediaQuery mediaQuery;
  late ResponsiveService responsiveService;

  setUp(() {
    mockFlutterWindowMediaQuery = MockMediaQueryData();
    mockBuildContext = MockBuildContext();
    mockMediaQueryData = MockMediaQueryData();
    mediaQuery = MediaQuery(
      data: mockMediaQueryData,
      child: const SizedBox(),
    );
    responsiveService = ResponsiveService(
      flutterWindowMediaQuery: mockFlutterWindowMediaQuery,
    );

    when(mockBuildContext.widget).thenReturn(const SizedBox());
    when(mockBuildContext.getElementForInheritedWidgetOfExactType())
        .thenReturn(InheritedElement(mediaQuery));
    when(mockBuildContext.dependOnInheritedWidgetOfExactType<MediaQuery>())
        .thenReturn(mediaQuery);
  });

  const double tScreenHeight = 800;
  const double tScreenWidth = 400;
  const double tVerticalPadding = 8;
  const double tHorizontalPadding = 4;
  const EdgeInsets tPadding = EdgeInsets.all(0);

  group('fullScreenHeight', () {
    test(
      'should return same result from MediaQueryData.size.height',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(0, tScreenHeight));
        // WHEN
        final result = responsiveService.fullScreenHeight(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        expect(result, tScreenHeight);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('fullScreenWidth', () {
    test(
      'should return same result from MediaQueryData.size.width',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(tScreenWidth, 0));
        // WHEN
        final result = responsiveService.fullScreenWidth(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        expect(result, tScreenWidth);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('availableScreenHeight', () {
    test(
      'should return same result from fullScreenHeight - viewPaddingFromFlutterWindow.vertical',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(0, tScreenHeight));
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.symmetric(vertical: tVerticalPadding),
        );
        // WHEN
        final result =
            responsiveService.availableScreenHeight(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        expect(result, tScreenHeight - (tVerticalPadding * 2));
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('availableScreenWidth', () {
    test(
      'should return same result from fullScreenWidth - viewPaddingFromFlutterWindow.horizontal',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(tScreenWidth, 0));
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.symmetric(horizontal: tHorizontalPadding),
        );
        // WHEN
        final result = responsiveService.availableScreenWidth(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        expect(result, tScreenWidth - (tHorizontalPadding * 2));
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('deviceTopPadding', () {
    test(
      'should return same result from paddingFromFlutterWindow.top',
      () {
        // GIVEN
        when(mockFlutterWindowMediaQuery.padding).thenAnswer(
          (_) => const EdgeInsets.only(top: tVerticalPadding),
        );
        // WHEN
        final result = responsiveService.deviceTopPadding;
        // THEN
        verify(mockFlutterWindowMediaQuery.padding).called(1);
        expect(result, tVerticalPadding);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('deviceBottomPadding', () {
    test(
      'should return same result from paddingFromFlutterWindow.bottom',
      () {
        // GIVEN
        when(mockFlutterWindowMediaQuery.padding).thenAnswer(
          (_) => const EdgeInsets.only(bottom: tVerticalPadding),
        );
        // WHEN
        final result = responsiveService.deviceBottomPadding;
        // THEN
        verify(mockFlutterWindowMediaQuery.padding).called(1);
        expect(result, tVerticalPadding);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('deviceBottomViewPadding', () {
    test(
      'should return same result from viewPaddingFromFlutterWindow.bottom',
      () {
        // GIVEN
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.only(bottom: tVerticalPadding),
        );
        // WHEN
        final result = responsiveService.deviceBottomViewPadding;
        // THEN
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        expect(result, tVerticalPadding);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('paddingFromFlutterWindow', () {
    test(
      'should return same result from flutterWindowMediaQuery.padding',
      () {
        // GIVEN
        when(mockFlutterWindowMediaQuery.padding).thenAnswer((_) => tPadding);
        // WHEN
        final result = responsiveService.paddingFromFlutterWindow;
        // THEN
        verify(mockFlutterWindowMediaQuery.padding).called(1);
        expect(result, tPadding);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('viewPaddingFromFlutterWindow', () {
    test(
      'should return same result from flutterWindowMediaQuery.viewPadding',
      () {
        // GIVEN
        when(mockFlutterWindowMediaQuery.viewPadding)
            .thenAnswer((_) => tPadding);
        // WHEN
        final result = responsiveService.viewPaddingFromFlutterWindow;
        // THEN
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        expect(result, tPadding);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('deviceKeyboardHeight', () {
    test(
      'should return same result from MediaQueryData.viewInsets.bottom',
      () {
        // GIVEN
        when(mockMediaQueryData.viewInsets)
            .thenAnswer((_) => const EdgeInsets.only(bottom: tVerticalPadding));
        // WHEN
        final result = responsiveService.deviceKeyboardHeight(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.viewInsets).called(1);
        expect(result, tVerticalPadding);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('textScaleFactor', () {
    test(
      'should return same result from MediaQueryData.textScaleFactor',
      () {
        // GIVEN
        const double tTextScaleFactor = 2.0;
        when(mockMediaQueryData.textScaleFactor)
            .thenAnswer((_) => tTextScaleFactor);
        // WHEN
        final result = responsiveService.textScaleFactor(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.textScaleFactor).called(1);
        expect(result, tTextScaleFactor);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('devicePixelRatio', () {
    test(
      'should return same result from MediaQueryData.devicePixelRatio',
      () {
        // GIVEN
        const double tDevicePixelRatio = 3.0;
        when(mockMediaQueryData.devicePixelRatio)
            .thenAnswer((_) => tDevicePixelRatio);
        // WHEN
        final result = responsiveService.devicePixelRatio(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.devicePixelRatio).called(1);
        expect(result, tDevicePixelRatio);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('orientation', () {
    test(
      'should return same result from MediaQueryData.orientation',
      () {
        // GIVEN
        const tOrientation = Orientation.portrait;
        when(mockMediaQueryData.orientation).thenAnswer((_) => tOrientation);
        // WHEN
        final result = responsiveService.orientation(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.orientation).called(1);
        expect(result, tOrientation);
        verifyNoMoreInteractions(mockMediaQueryData);
      },
    );
  });

  group('scaleWidth', () {
    test(
      'should return same result from availableScreenWidth - designSize.width',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(tScreenWidth, 0));
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.symmetric(horizontal: tHorizontalPadding),
        );
        // WHEN
        final result = responsiveService.scaleWidth(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        const availableScreenWidth = (tScreenWidth - (tHorizontalPadding * 2));
        final designWidth = responsiveService.designSize.width;
        expect(result, availableScreenWidth / designWidth);
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('scaleHeight', () {
    setUp(() {
      when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
        (_) => const EdgeInsets.symmetric(vertical: tVerticalPadding),
      );
    });
    test(
      'should return same result from availableScreenHeight - designSize.height',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(0, tScreenHeight));
        // WHEN
        final result = responsiveService.scaleHeight(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);
        const availableScreenHeight = (tScreenHeight - (tVerticalPadding * 2));
        final designHeight = responsiveService.designSize.height;
        expect(result, availableScreenHeight / designHeight);
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
    test(
      'should return same result from max(availableScreenHeight(context), minHeight) - designSize.height'
      'if minHeightMode is enabled and screenHeight < minHeight',
      () {
        // GIVEN
        responsiveService = ResponsiveService(
          flutterWindowMediaQuery: mockFlutterWindowMediaQuery,
          minHeightMode: true,
        );
        final double tScreenHeight = responsiveService.minHeight - 100;
        when(mockMediaQueryData.size).thenAnswer((_) => Size(0, tScreenHeight));
        final result = responsiveService.scaleHeight(
          mockBuildContext,
        );
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);

        double availableScreenHeight = (tScreenHeight - (tVerticalPadding * 2));
        availableScreenHeight = max(
          availableScreenHeight,
          responsiveService.minHeight,
        );
        final designHeight = responsiveService.designSize.height;

        expect(result, availableScreenHeight / designHeight);
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
    test(
      'should return same result from availableScreenHeight(context) - designSize.height'
      'if minHeightMode is disabled and screenHeight < minHeight',
      () {
        // GIVEN
        responsiveService = ResponsiveService(
          flutterWindowMediaQuery: mockFlutterWindowMediaQuery,
          minHeightMode: false,
        );
        final double tScreenHeight = responsiveService.minHeight - 100;
        when(mockMediaQueryData.size).thenAnswer((_) => Size(0, tScreenHeight));
        final result = responsiveService.scaleHeight(
          mockBuildContext,
        );
        // THEN
        verify(mockMediaQueryData.size).called(1);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(1);

        double availableScreenHeight = (tScreenHeight - (tVerticalPadding * 2));
        final designHeight = responsiveService.designSize.height;

        expect(result, availableScreenHeight / designHeight);
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('scaleRadius', () {
    test(
      'should return same result from min(scaleWidth,scaleHeight)',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(tScreenWidth, tScreenHeight));
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.symmetric(
            vertical: tVerticalPadding,
            horizontal: tHorizontalPadding,
          ),
        );
        // WHEN
        final result = responsiveService.scaleRadius(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(2);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(2);

        const availableScreenWidth = (tScreenWidth - (tHorizontalPadding * 2));
        final designWidth = responsiveService.designSize.width;
        final scaleWidth = availableScreenWidth / designWidth;

        const availableScreenHeight = (tScreenHeight - (tVerticalPadding * 2));
        final designHeight = responsiveService.designSize.height;
        final scaleHeight = availableScreenHeight / designHeight;

        expect(result, min(scaleWidth, scaleHeight));
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });

  group('scaleText', () {
    test(
      'should return same result from min(scaleWidth,scaleHeight)',
      () {
        // GIVEN
        when(mockMediaQueryData.size)
            .thenAnswer((_) => const Size(tScreenWidth, tScreenHeight));
        when(mockFlutterWindowMediaQuery.viewPadding).thenAnswer(
          (_) => const EdgeInsets.symmetric(
            vertical: tVerticalPadding,
            horizontal: tHorizontalPadding,
          ),
        );
        // WHEN
        final result = responsiveService.scaleText(mockBuildContext);
        // THEN
        verify(mockMediaQueryData.size).called(2);
        verify(mockFlutterWindowMediaQuery.viewPadding).called(2);

        const availableScreenWidth = (tScreenWidth - (tHorizontalPadding * 2));
        final designWidth = responsiveService.designSize.width;
        final scaleWidth = availableScreenWidth / designWidth;

        const availableScreenHeight = (tScreenHeight - (tVerticalPadding * 2));
        final designHeight = responsiveService.designSize.height;
        final scaleHeight = availableScreenHeight / designHeight;

        expect(result, min(scaleWidth, scaleHeight));
        verifyNoMoreInteractions(mockMediaQueryData);
        verifyNoMoreInteractions(mockFlutterWindowMediaQuery);
      },
    );
  });
}
