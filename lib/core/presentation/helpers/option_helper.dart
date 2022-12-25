import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

Option<T> valueToOption<T>(AsyncValue<T> v) => v.valueOrNull.toOption();
