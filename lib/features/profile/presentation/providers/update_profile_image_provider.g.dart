// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateProfileImageStateHash() =>
    r'bc0eb820307c10ef5657b4c16beefb7f1864ef2c';

/// See also [updateProfileImageState].
@ProviderFor(updateProfileImageState)
final updateProfileImageStateProvider =
    AutoDisposeFutureProvider<Option<String>>.internal(
  updateProfileImageState,
  name: r'updateProfileImageStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateProfileImageStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateProfileImageStateRef
    = AutoDisposeFutureProviderRef<Option<String>>;
String _$updateProfileImageHash() =>
    r'2856d4bf7dfd90a96582137e00294dbcb7bcf697';

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

typedef UpdateProfileImageRef = AutoDisposeFutureProviderRef<String>;

/// See also [updateProfileImage].
@ProviderFor(updateProfileImage)
const updateProfileImageProvider = UpdateProfileImageFamily();

/// See also [updateProfileImage].
class UpdateProfileImageFamily extends Family<AsyncValue<String>> {
  /// See also [updateProfileImage].
  const UpdateProfileImageFamily();

  /// See also [updateProfileImage].
  UpdateProfileImageProvider call(
    Event<File> event,
  ) {
    return UpdateProfileImageProvider(
      event,
    );
  }

  @override
  UpdateProfileImageProvider getProviderOverride(
    covariant UpdateProfileImageProvider provider,
  ) {
    return call(
      provider.event,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateProfileImageProvider';
}

/// See also [updateProfileImage].
class UpdateProfileImageProvider extends AutoDisposeFutureProvider<String> {
  /// See also [updateProfileImage].
  UpdateProfileImageProvider(
    this.event,
  ) : super.internal(
          (ref) => updateProfileImage(
            ref,
            event,
          ),
          from: updateProfileImageProvider,
          name: r'updateProfileImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProfileImageHash,
          dependencies: UpdateProfileImageFamily._dependencies,
          allTransitiveDependencies:
              UpdateProfileImageFamily._allTransitiveDependencies,
        );

  final Event<File> event;

  @override
  bool operator ==(Object other) {
    return other is UpdateProfileImageProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$updateProfileImageEventHash() =>
    r'b8cf870551942186749474b22449e793c9a0fdae';

/// See also [UpdateProfileImageEvent].
@ProviderFor(UpdateProfileImageEvent)
final updateProfileImageEventProvider = AutoDisposeNotifierProvider<
    UpdateProfileImageEvent, Option<Event<File>>>.internal(
  UpdateProfileImageEvent.new,
  name: r'updateProfileImageEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateProfileImageEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UpdateProfileImageEvent = AutoDisposeNotifier<Option<Event<File>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
