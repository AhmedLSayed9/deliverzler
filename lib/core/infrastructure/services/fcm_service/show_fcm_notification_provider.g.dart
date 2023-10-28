// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_fcm_notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showFCMNotificationHash() => r'8c07c4812546458ecb57e9b4abf816026b2e4032';

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

typedef ShowFCMNotificationRef = AutoDisposeFutureProviderRef<void>;

/// See also [showFCMNotification].
@ProviderFor(showFCMNotification)
const showFCMNotificationProvider = ShowFCMNotificationFamily();

/// See also [showFCMNotification].
class ShowFCMNotificationFamily extends Family<AsyncValue<void>> {
  /// See also [showFCMNotification].
  const ShowFCMNotificationFamily();

  /// See also [showFCMNotification].
  ShowFCMNotificationProvider call(
    RemoteMessage message,
  ) {
    return ShowFCMNotificationProvider(
      message,
    );
  }

  @override
  ShowFCMNotificationProvider getProviderOverride(
    covariant ShowFCMNotificationProvider provider,
  ) {
    return call(
      provider.message,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'showFCMNotificationProvider';
}

/// See also [showFCMNotification].
class ShowFCMNotificationProvider extends AutoDisposeFutureProvider<void> {
  /// See also [showFCMNotification].
  ShowFCMNotificationProvider(
    this.message,
  ) : super.internal(
          (ref) => showFCMNotification(
            ref,
            message,
          ),
          from: showFCMNotificationProvider,
          name: r'showFCMNotificationProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$showFCMNotificationHash,
          dependencies: ShowFCMNotificationFamily._dependencies,
          allTransitiveDependencies: ShowFCMNotificationFamily._allTransitiveDependencies,
        );

  final RemoteMessage message;

  @override
  bool operator ==(Object other) {
    return other is ShowFCMNotificationProvider && other.message == message;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
