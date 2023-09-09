// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserStateHash() => r'd16e022b3657f254a8e901a431c52311b73da818';

/// See also [currentUserState].
@ProviderFor(currentUserState)
final currentUserStateProvider = AutoDisposeFutureProvider<User>.internal(
  currentUserState,
  name: r'currentUserStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserStateRef = AutoDisposeFutureProviderRef<User>;
String _$currentUserHash() => r'a4c1c6b5d12d4eea16187cb31f05001c09d5839f';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeProvider<User>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeProviderRef<User>;
String _$authStateHash() => r'1009ba3f81452f2e5b7062ad2709ebc8cacc8375';

/// See also [AuthState].
@ProviderFor(AuthState)
final authStateProvider = NotifierProvider<AuthState, Option<User>>.internal(
  AuthState.new,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthState = Notifier<Option<User>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
