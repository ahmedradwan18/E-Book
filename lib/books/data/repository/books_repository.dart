import 'package:dartz/dartz.dart';
import 'package:e_books/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/core/error/exceptions.dart';
import 'package:e_books/core/error/failure.dart';

class BooksRepository extends BaseBookRepository {
  final BaseBookRemoteDataSource baseBookRemoteDataSource;

  BooksRepository({required this.baseBookRemoteDataSource});

  @override
  Future<Either<Failure, List<BookModel>>> getAllBooks() async {
    final result = await baseBookRemoteDataSource.getAllBooks();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
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
}
