import 'package:dartz/dartz.dart';
import 'package:e_books/core/error/failure.dart';
import 'package:e_books/features/books/domain/entities/book.dart';

abstract class BaseBookRepository{

  Future<Either<Failure,List<Book>>>getAllBooks();
  Future<Either<Failure,List<Book>>> searchBooks(String bookName);
  Future<Either<Failure,List<Book>>> filterBooks(String topicName);
  Future<Either<Failure,List<Book>>> getExtraBooks(int pageNumber);

}