import 'package:dartz/dartz.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/error/failure.dart';

abstract class BaseBookRepository{

  Future<Either<Failure,List<Book>>>getAllBooks();
  Future<Either<Failure,List<Book>>> searchBooks(String bookName);
  Future<Either<Failure,List<Book>>> filterBooks(String topicName);

}