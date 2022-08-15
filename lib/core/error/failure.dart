import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({message}):super(message: message);

 // ServerFailure() : super(message: super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(message) : super(message: message);
}

