import 'package:dartz/dartz.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/core/error/failure.dart';
import 'package:e_books/core/usecase/base_useCase.dart';

class GetAllBooksUsecase extends BaseUseCase<List<Book>> {
  final BaseBookRepository baseBookRepository;

  GetAllBooksUsecase({required this.baseBookRepository});

  @override
  Future<Either<Failure, List<Book>>> call() async {
    return await baseBookRepository.getAllBooks();
  }
}
