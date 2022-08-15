import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final int statusCode;
  final int message;
  final bool success;

 const ErrorMessageModel({required this.statusCode,required this.message,required this.success});



  factory ErrorMessageModel.fromJson(Map<String,dynamic> json){
    return ErrorMessageModel(message: json['message'],statusCode: json['status_code'],success: json['success']);
  }

  @override
  List<Object?> get props => [statusCode,message,success];
}