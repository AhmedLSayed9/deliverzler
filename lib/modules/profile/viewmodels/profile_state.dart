import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;

  const factory ProfileState.error({String? errorText}) = _Error;

  const factory ProfileState.available() = _Available;
}
