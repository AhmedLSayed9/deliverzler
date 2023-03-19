part of '../utils/riverpod_framework.dart';

extension WidgetRefExtension on WidgetRef {
  bool isLoading<T>(ProviderListenable<AsyncValue<T>> provider) {
    return watch(provider.select((AsyncValue<T> s) => s.isLoading));
  }

  /// Listen to a provider while easy handling Loading/Error dialogs.
  ///
  /// You can set handleLoading/handleError to false to turn off auto handling for either of them.
  ///
  /// Use `whenData` If you want to perform something when the newState is data.
  void easyListen<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    bool handleLoading = true,
    bool handleError = true,
    void Function(T data)? whenData,
  }) {
    return listen(
      provider,
      (prevState, newState) {
        prevState?.whenOrNull(
          skipLoadingOnRefresh: false,
          loading: handleLoading
              ? () => NavigationService.dismissDialog(context)
              : null,
        );
        newState.whenOrNull(
          skipLoadingOnRefresh: false,
          loading:
              handleLoading ? () => Dialogs.showLoadingDialog(context) : null,
          error: handleError
              ? (err, st) => Dialogs.showErrorDialog(
                    context,
                    message: err.errorMessage(context),
                  )
              : null,
          data: whenData,
        );
      },
    );
  }

  /// Keep listening to a provider until a Future function is complete.
  ///
  /// This method should be called asynchronously, like inside an onPressed.
  /// It shouldn't be used directly inside the build method.
  ///
  /// This is useful to preserve provider's state when navigating to a route
  /// until that route is popped off.
  Future<void> listenUntil<T>(
    ProviderListenable<T> provider,
    Future<void> Function() cb,
  ) async {
    final sub = listenManual(provider, (_, __) {});
    try {
      return await cb();
    } finally {
      sub.close();
    }
  }
}
