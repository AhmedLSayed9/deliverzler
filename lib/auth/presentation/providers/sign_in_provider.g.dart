// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signInStateHash() => r'efbbf509188927973d1127495ab3e28b0d60097c';

/// See also [signInState].
@ProviderFor(signInState)
final signInStateProvider = AutoDisposeFutureProvider<Option<User>>.internal(
  signInState,
  name: r'signInStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInStateRef = AutoDisposeFutureProviderRef<Option<User>>;
String _$signInHash() => r'08069438b67cb33187d5357d7d44dda900ad207c';

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

typedef SignInRef = AutoDisposeFutureProviderRef<User>;

/// See also [signIn].
@ProviderFor(signIn)
const signInProvider = SignInFamily();

/// See also [signIn].
class SignInFamily extends Family<AsyncValue<User>> {
  /// See also [signIn].
  const SignInFamily();

  /// See also [signIn].
  SignInProvider call(
    Event<SignInWithEmail> event,
  ) {
    return SignInProvider(
      event,
    );
  }

  @override
  SignInProvider getProviderOverride(
    covariant SignInProvider provider,
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
  String? get name => r'signInProvider';
}

/// See also [signIn].
class SignInProvider extends AutoDisposeFutureProvider<User> {
  /// See also [signIn].
  SignInProvider(
    this.event,
  ) : super.internal(
          (ref) => signIn(
            ref,
            event,
          ),
          from: signInProvider,
          name: r'signInProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$signInHash,
          dependencies: SignInFamily._dependencies,
          allTransitiveDependencies: SignInFamily._allTransitiveDependencies,
        );

  final Event<SignInWithEmail> event;

  @override
  bool operator ==(Object other) {
    return other is SignInProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$signInWithEmailEventHash() => r'ed6e0942c8185c5719a58e5615f092db8e9bcff4';

/// See also [SignInWithEmailEvent].
@ProviderFor(SignInWithEmailEvent)
final signInWithEmailEventProvider =
    AutoDisposeNotifierProvider<SignInWithEmailEvent, Option<Event<SignInWithEmail>>>.internal(
  SignInWithEmailEvent.new,
  name: r'signInWithEmailEventProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signInWithEmailEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignInWithEmailEvent = AutoDisposeNotifier<Option<Event<SignInWithEmail>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
