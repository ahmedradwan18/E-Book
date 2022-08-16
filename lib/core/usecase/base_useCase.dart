import 'package:dartz/dartz.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T,Parameters>{
  Future<Either<Failure, T>> call(Parameters parameters);
}


class NoParameters extends Equatable{

  const NoParameters();
  @override
  List<Object?> get props => [];

}