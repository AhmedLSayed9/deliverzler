// This is no longer needed.
// MediaQuery-based fractional scaling is not recommended.

/*
class ResponsiveService {
  ResponsiveService({
    MediaQueryData? flutterWindowMediaQuery,
    this.designSize = const Size(428, 860),
    this.minHeightMode = true,
    this.minHeight = 667,
  }) {
    _flutterWindowMediaQuery =
        flutterWindowMediaQuery ?? MediaQueryData.fromWindow(window);
  }

  late final MediaQueryData _flutterWindowMediaQuery;
  final Size designSize;

  //Support orientation change and split-screen mode to show same proper design.
  //should be used with scrollable screens.
  final bool minHeightMode;
  final double minHeight;

  //This will get fullscreen height even if used inside safeArea.
  //note: it includes (Notches/StatusBar) height for Android/iOS and (Home Indicator) height for iOS.
  //note: it doesn't include Android system bottom navigation bar (if enabled).
  double fullScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double fullScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  //Recommended Approach:
  //When using sizes from UI/UX, use height between StatusBar and device BNB, as StatusBar and BNB differ from device to device.
  //Don't use top safeArea for Android/iOS Notches/StatusBar, as AppBar already wrapped with SafeArea, and to set StatusBar
  //without AppBar, use EmptyAppBar (preferredSize: Size.fromHeight(0)). This let Drawer be able to open in fullscreen, etc.
  //more details: https://github.com/flutter/flutter/issues/4518#issuecomment-424298638
  //Don't use bottom safeArea for iOS Home Indicator, instead, manually add bottomViewPadding (Home Indicator height)
  //as bottom padding to the Screen [if we use CupertinoTabBar, it already add bottomPadding]. This let screens without
  //CupertinoTabBar(BNB) have good looking scrolling behavior behind the home indicator.
  double availableScreenHeight(BuildContext context) =>
      fullScreenHeight(context) - viewPaddingFromFlutterWindow.vertical;

  double availableScreenWidth(BuildContext context) =>
      fullScreenWidth(context) - viewPaddingFromFlutterWindow.horizontal;

  //padding: The parts of the display that are partially obscured by system UI
  //This Typically used to calculate the hardware display notches, Home Indicator or the system status bar
  //note: .bottom doesn't get Android's system navigation bar as flutter already ignoring it when getting screen size
  //more details: https://www.youtube.com/watch?v=ceCo8U0XHqw
  double get deviceTopPadding => paddingFromFlutterWindow.top;

  double get deviceBottomPadding => paddingFromFlutterWindow.bottom;

  //viewPadding: Same as padding but it maintains its value when keyboard opens, unlike padding which drops to zero.
  //This is useful to avoid shifting widgets down a little pixels when keyboard open
  double get deviceBottomViewPadding => viewPaddingFromFlutterWindow.bottom;

  //Use padding from SingletonFlutterWindow instead of MediaQuery.of(context)
  //is necessary to fix 0.0 padding value when using inside SafeArea or when using with Appbar
  //more details: https://stackoverflow.com/questions/59360687/how-to-get-safe-area-size-padding-in-flutter/70720035#70720035
  EdgeInsets get paddingFromFlutterWindow => _flutterWindowMediaQuery.padding;

  EdgeInsets get viewPaddingFromFlutterWindow =>
      _flutterWindowMediaQuery.viewPadding;

  //viewInsets: The parts of the display that are completely obscured by system UI
  //This typically used to calculate device's keyboard height when it's visible
  double deviceKeyboardHeight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  double devicePixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  double scaleWidth(BuildContext context) =>
      availableScreenWidth(context) / designSize.width;

  double scaleHeight(BuildContext context) {
    final availableHeight = minHeightMode
        ? max(availableScreenHeight(context), minHeight)
        : availableScreenHeight(context);
    return availableHeight / designSize.height;
  }

  double scaleRadius(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));

  double scaleText(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));
}
*/
