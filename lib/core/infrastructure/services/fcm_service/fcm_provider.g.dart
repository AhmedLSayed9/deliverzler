// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fcmHash() => r'8af107ce8b7d6a6b400981a32a252885bd1d9d93';

/// See also [fcm].
@ProviderFor(fcm)
final fcmProvider = Provider<FirebaseMessaging>.internal(
  fcm,
  name: r'fcmProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$fcmHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FcmRef = ProviderRef<FirebaseMessaging>;
String _$setupFCMHash() => r'b3f5b5d4a4791d525b766455771236e62b281244';

/// See also [setupFCM].
@ProviderFor(setupFCM)
final setupFCMProvider = AutoDisposeFutureProvider<void>.internal(
  setupFCM,
  name: r'setupFCMProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$setupFCMHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SetupFCMRef = AutoDisposeFutureProviderRef<void>;
String _$grantFCMPermissionHash() => r'3e88cdcf371024d437e10a3e55a774d743d04cef';

/// See also [_grantFCMPermission].
@ProviderFor(_grantFCMPermission)
final _grantFCMPermissionProvider = AutoDisposeFutureProvider<AuthorizationStatus>.internal(
  _grantFCMPermission,
  name: r'_grantFCMPermissionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$grantFCMPermissionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _GrantFCMPermissionRef = AutoDisposeFutureProviderRef<AuthorizationStatus>;
String _$setupAndroidHeadsUpHash() => r'd5e832e7c4b869242ec81c996b7afa7ee985aa3a';

/// See also [_setupAndroidHeadsUp].
@ProviderFor(_setupAndroidHeadsUp)
final _setupAndroidHeadsUpProvider = AutoDisposeFutureProvider<void>.internal(
  _setupAndroidHeadsUp,
  name: r'_setupAndroidHeadsUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$setupAndroidHeadsUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SetupAndroidHeadsUpRef = AutoDisposeFutureProviderRef<void>;
String _$setupIOSHeadsUpHash() => r'88c3e07d5003c13bc67f64aee18788560884f267';

/// See also [_setupIOSHeadsUp].
@ProviderFor(_setupIOSHeadsUp)
final _setupIOSHeadsUpProvider = AutoDisposeFutureProvider<void>.internal(
  _setupIOSHeadsUp,
  name: r'_setupIOSHeadsUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$setupIOSHeadsUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SetupIOSHeadsUpRef = AutoDisposeFutureProviderRef<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
