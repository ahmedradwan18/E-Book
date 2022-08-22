import 'package:e_books/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}


class LocalDataBaseException implements Exception{
  final String errorMessage;

  const LocalDataBaseException({required this.errorMessage});
}


class OfflineException implements Exception{
  final String errorMessage;

  const OfflineException({required this.errorMessage});
}