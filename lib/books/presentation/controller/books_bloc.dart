import 'dart:async';

import 'package:e_books/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/books/data/repository/books_repository.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/books/domain/usecases/get_all_books_usecase.dart';
import 'package:e_books/books/presentation/controller/books_events.dart';
import 'package:e_books/books/presentation/controller/books_states.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BooksEvent, BookStates> {
  final GetAllBooksUsecase getAllBooksUsecase;
  List<Book> bookList = [];

  BookBloc(BookStates initialState, this.getAllBooksUsecase)
      : super(const BookStates(allBooksState: RequestState.loading)) {


    on<GetAllBooksEvent>(_getAllBooks);
  }




  FutureOr<void> _getAllBooks(GetAllBooksEvent event, Emitter<BookStates> emit)  async {
      final result = await getAllBooksUsecase();

      emit(const BookStates(allBooksState: RequestState.loaded));
      result.fold(
              (l) => emit(state.copyWith(
              allBooksState: RequestState.error,
              allBooksMessage: l.message)), (r) {
        emit(state.copyWith(
            allBooksState: RequestState.loaded, allBooksList: r));
        bookList = r;
      });

  }
}
