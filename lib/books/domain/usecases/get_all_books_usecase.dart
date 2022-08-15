import 'package:dartz/dartz.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/core/error/failure.dart';

class GetAllBooksUsecase {
  final BaseBookRepository baseBookRepository;

  GetAllBooksUsecase({required this.baseBookRepository});

  Future<Either<Failure, List<Book>>> execute() async {
    return await baseBookRepository.getAllBooks();
  }
}
