/// This file is used to export all the functional programming libraries used in
/// the project. It also exports the [FpState] type alias, which is used to
/// avoid conflicts with the [State] class from the Flutter SDK.
import 'package:fpdart/fpdart.dart' as fpdart show State;

/// The `fpdart` library is used to create functional programming constructs.
export 'package:fpdart/fpdart.dart' hide State;
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// A type alias for the [State] class from the `fpdart` library.
typedef FpState<S, A> = fpdart.State<S, A>;

Option<T> valueToOption<T>(AsyncValue<T> v) => v.valueOrNull.toOption();
