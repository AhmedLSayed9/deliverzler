part of '../utils/riverpod_framework.dart';

extension WidgetRefExtension on WidgetRef {
  bool isLoading<T>(ProviderListenable<AsyncValue<T>> provider) {
    return watch(provider.select((AsyncValue<T> s) => s.isLoading));
  }

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
}
