import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/core/error/exceptions.dart';
import 'package:e_books/core/network/error_message_model.dart';
import 'package:e_books/core/utils/app_constatnts.dart';


abstract class BaseBookRemoteDataSource{
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getUnKnownBooks();
}


class BookRemoteDataSource extends BaseBookRemoteDataSource{

  @override
 Future<List<BookModel>> getAllBooks()async{
   final response=await Dio().get(AppConstants.baseUrl+AppConstants.allBooksEndPoint);
log('response is ${response.toString()}');
   if(response.statusCode==200){
     return List<BookModel>.from((response.data['results']).map((e){
       return BookModel.fromJson(e);
     } ));
   }
   else {
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }

 }

 
  @override
  Future<List<BookModel>> getUnKnownBooks()async {
    final response=await Dio().get(AppConstants.baseUrl+AppConstants.allBooksEndPoint);
    List<BookModel> allBooks=[];
    List<BookModel> unKnownBooks=[];
    if(response.statusCode==200){
      allBooks=List<BookModel>.from((response.data['results'] as List).map((e) => BookModel.fromJson(e)));
      unKnownBooks=allBooks.where((element) => element.downloadCount<2000).toList();
      return unKnownBooks;
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}