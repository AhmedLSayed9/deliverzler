part of '../utils/riverpod_framework.dart';

extension WidgetRefExtension on WidgetRef {
  bool isLoading<T>(ProviderListenable<AsyncValue<T>> provider) {
    return watch(provider.select((AsyncValue<T> s) => s.isLoading));
  }
}
