// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_app_theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentAppThemeModeHash() =>
    r'33a471e3b3ba92d877a97cb840e99be8e3d6a6cd';

/// See also [currentAppThemeMode].
@ProviderFor(currentAppThemeMode)
final currentAppThemeModeProvider = Provider<AppThemeMode>.internal(
  currentAppThemeMode,
  name: r'currentAppThemeModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentAppThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentAppThemeModeRef = ProviderRef<AppThemeMode>;
String _$platformBrightnessHash() =>
    r'45d60c888829ec39a19ad4496abb7407e1e9ec96';

/// See also [PlatformBrightness].
@ProviderFor(PlatformBrightness)
final platformBrightnessProvider =
    NotifierProvider<PlatformBrightness, Brightness>.internal(
  PlatformBrightness.new,
  name: r'platformBrightnessProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$platformBrightnessHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlatformBrightness = Notifier<Brightness>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
