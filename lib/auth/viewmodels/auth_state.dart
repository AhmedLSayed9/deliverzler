import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.error({String? errorText}) = _Error;

  const factory AuthState.available() = _Available;
}
