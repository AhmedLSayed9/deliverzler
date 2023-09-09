// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signOutStateHash() => r'1821ada60583ed70deead6b1e89eeeb5ba98f8a9';

/// See also [signOutState].
@ProviderFor(signOutState)
final signOutStateProvider = AutoDisposeFutureProvider<SignOutState>.internal(
  signOutState,
  name: r'signOutStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signOutStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignOutStateRef = AutoDisposeFutureProviderRef<SignOutState>;
String _$signOutHash() => r'3e656044351e3d4ddedca9afe8e9ccfc9de48218';

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

typedef SignOutRef = AutoDisposeFutureProviderRef<void>;

/// See also [signOut].
@ProviderFor(signOut)
const signOutProvider = SignOutFamily();

/// See also [signOut].
class SignOutFamily extends Family<AsyncValue<void>> {
  /// See also [signOut].
  const SignOutFamily();

  /// See also [signOut].
  SignOutProvider call(
    Event<Unit> event,
  ) {
    return SignOutProvider(
      event,
    );
  }

  @override
  SignOutProvider getProviderOverride(
    covariant SignOutProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'signOutProvider';
}

/// See also [signOut].
class SignOutProvider extends AutoDisposeFutureProvider<void> {
  /// See also [signOut].
  SignOutProvider(
    this.event,
  ) : super.internal(
          (ref) => signOut(
            ref,
            event,
          ),
          from: signOutProvider,
          name: r'signOutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$signOutHash,
          dependencies: SignOutFamily._dependencies,
          allTransitiveDependencies: SignOutFamily._allTransitiveDependencies,
        );

  final Event<Unit> event;

  @override
  bool operator ==(Object other) {
    return other is SignOutProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$signOutEventHash() => r'8176bf4b92cb7ed1eb69ed363afdf6b658836028';

/// See also [SignOutEvent].
@ProviderFor(SignOutEvent)
final signOutEventProvider =
    AutoDisposeNotifierProvider<SignOutEvent, Option<Event<Unit>>>.internal(
  SignOutEvent.new,
  name: r'signOutEventProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signOutEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignOutEvent = AutoDisposeNotifier<Option<Event<Unit>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
