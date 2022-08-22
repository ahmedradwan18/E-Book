import 'package:dartz/dartz.dart';

import 'package:e_books/core/error/failure.dart';
import 'package:e_books/core/usecase/base_useCase.dart';
import 'package:e_books/features/books/domain/entities/book.dart';
import 'package:e_books/features/books/domain/repository/base_book_repository.dart';

class FilterBooksUsecase extends BaseUseCase<List<Book>,String>{

  final BaseBookRepository baseBookRepository;

  FilterBooksUsecase({ required this.baseBookRepository});

  @override
  Future<Either<Failure,List<Book>>> call(String name)async{
    return await baseBookRepository.filterBooks(name);
  }
}


