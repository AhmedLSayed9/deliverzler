// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_local_notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showLocalNotificationHash() => r'73cb1003341bb598c31cba9161b0af7c26c597c5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef ShowLocalNotificationRef = AutoDisposeFutureProviderRef<void>;

/// See also [showLocalNotification].
@ProviderFor(showLocalNotification)
const showLocalNotificationProvider = ShowLocalNotificationFamily();

/// See also [showLocalNotification].
class ShowLocalNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [showLocalNotification].
  const ShowLocalNotificationFamily();

  /// See also [showLocalNotification].
  ShowLocalNotificationProvider call(
    ShowLocalNotificationParams params,
  ) {
    return ShowLocalNotificationProvider(
      params,
    );
  }

  @override
  ShowLocalNotificationProvider getProviderOverride(
    covariant ShowLocalNotificationProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'showLocalNotificationProvider';
}

/// See also [showLocalNotification].
class ShowLocalNotificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [showLocalNotification].
  ShowLocalNotificationProvider(
    this.params,
  ) : super.internal(
          (ref) => showLocalNotification(
            ref,
            params,
          ),
          from: showLocalNotificationProvider,
          name: r'showLocalNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$showLocalNotificationHash,
          dependencies: ShowLocalNotificationFamily._dependencies,
          allTransitiveDependencies: ShowLocalNotificationFamily._allTransitiveDependencies,
        );

  final ShowLocalNotificationParams params;

  @override
  bool operator ==(Object other) {
    return other is ShowLocalNotificationProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
