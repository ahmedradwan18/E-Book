import 'package:dartz/dartz.dart';

import 'package:e_books/core/error/failure.dart';
import 'package:e_books/core/usecase/base_useCase.dart';
import 'package:e_books/features/books/domain/entities/book.dart';
import 'package:e_books/features/books/domain/repository/base_book_repository.dart';

class GetExtraBooksUsecase extends BaseUseCase<List<Book>,int> {
  final BaseBookRepository baseBookRepository;

  GetExtraBooksUsecase({required this.baseBookRepository});

  @override
  Future<Either<Failure, List<Book>>> call(int pageNumber) async {
    return await baseBookRepository.getExtraBooks(pageNumber);
  }
}
