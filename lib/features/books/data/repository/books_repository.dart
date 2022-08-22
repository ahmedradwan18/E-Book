import 'package:dartz/dartz.dart';

import 'package:e_books/core/error/exceptions.dart';
import 'package:e_books/core/error/failure.dart';
import 'package:e_books/core/network/network_info.dart';
import 'package:e_books/features/books/data/datasource/book_local_datasource.dart';
import 'package:e_books/features/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/features/books/data/models/book_model.dart';
import 'package:e_books/features/books/domain/entities/book.dart';
import 'package:e_books/features/books/domain/repository/base_book_repository.dart';
import 'package:hive_flutter/adapters.dart';

class BooksRepository extends BaseBookRepository {
  final BaseBookRemoteDataSource baseBookRemoteDataSource;
  final BaseBookLocalDataSource baseBookLocalDataSource;
  final NetworkInfo networkInfo;

  BooksRepository({
    required this.baseBookRemoteDataSource,
    required this.baseBookLocalDataSource,
    required this.networkInfo,
  });





  @override
  Future<Either<Failure, List<Book>>> getAllBooks() async {
    Box box = await baseBookLocalDataSource.openBox();
    if (await networkInfo.isConnected) {
      try {
        final result = await baseBookRemoteDataSource.getAllBooks();
        await baseBookLocalDataSource.cacheBooks(box, result);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.errorMessageModel.message));
      }
    } else {
      try {
        final localPosts = await baseBookLocalDataSource.getCachedBooks(box);
        print('localPosts.length ${localPosts.length}');
        return Right(localPosts);
      } on LocalDataBaseException catch (failure) {
        return Left(DatabaseFailure(message: failure.errorMessage.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(String name) async {
    final result = await baseBookRemoteDataSource.searchBooks(name);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> filterBooks(String topicName) async {
    final result = await baseBookRemoteDataSource.filterBooks(topicName);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getExtraBooks(int pageNumber) async {
    Box box = await baseBookLocalDataSource.openBox();

    if (await networkInfo.isConnected) {
      try {
        final result = await baseBookRemoteDataSource.getExtraBooks(pageNumber);
        await baseBookLocalDataSource.cacheBooks(box, result);
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.errorMessageModel.message));
      }
    } else {
      try {
        final localPosts = await baseBookLocalDataSource.getCachedBooks(box);
        print('localPosts.length ${localPosts.length}');
        return Right(localPosts);
      } on LocalDataBaseException catch (failure) {
        return Left(DatabaseFailure(message: failure.errorMessage.toString()));
      }
    }




  }
}
