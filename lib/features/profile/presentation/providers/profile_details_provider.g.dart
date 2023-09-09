// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileDetailsStateHash() =>
    r'1766d1b010fc2db3064f72fa8a833f883f2c5cba';

/// See also [profileDetailsState].
@ProviderFor(profileDetailsState)
final profileDetailsStateProvider =
    AutoDisposeFutureProvider<Option<ProfileDetails>>.internal(
  profileDetailsState,
  name: r'profileDetailsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileDetailsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileDetailsStateRef
    = AutoDisposeFutureProviderRef<Option<ProfileDetails>>;
String _$profileDetailsEventHash() =>
    r'c7af80b50c71fa7040e86c33347f31f23b411e3c';

/// See also [ProfileDetailsEvent].
@ProviderFor(ProfileDetailsEvent)
final profileDetailsEventProvider = AutoDisposeNotifierProvider<
    ProfileDetailsEvent, Option<Event<ProfileDetails>>>.internal(
  ProfileDetailsEvent.new,
  name: r'profileDetailsEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileDetailsEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileDetailsEvent
    = AutoDisposeNotifier<Option<Event<ProfileDetails>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
