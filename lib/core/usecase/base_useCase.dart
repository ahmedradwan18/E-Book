import 'package:dartz/dartz.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/error/failure.dart';

abstract class BaseUseCase<T>{
  Future<Either<Failure, T>> call();
}