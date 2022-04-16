import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return message;
  }
}

class DefaultFailure extends Failure {
  const DefaultFailure({required message}) : super(message: message);
}

class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({required message, this.statusCode})
      : super(message: message);
}
