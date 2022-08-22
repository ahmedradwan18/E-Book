import 'dart:async';

import 'package:e_books/core/usecase/base_useCase.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:e_books/features/books/domain/entities/book.dart';
import 'package:e_books/features/books/domain/usecases/filter_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/get_all_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/get_extra_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/search_books_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books_events.dart';
import 'books_states.dart';

class BookBloc extends Bloc<BooksEvent, BookStates> {
  final GetAllBooksUsecase getAllBooksUsecase;
  final SearchBooksUsecase searchBooksUsecase;
  final FilterBooksUsecase filterBooksUsecase;
  final GetExtraBooksUsecase extraBooksUsecase;

  List<Book> bookList = [];
  List<Book> searchList = [];
  List<Book> filterList = [];

  int selectedIndex = 0;
  int pageNumber = 1;





  BookBloc(BookStates initialState, this.getAllBooksUsecase,
      this.searchBooksUsecase, this.filterBooksUsecase, this.extraBooksUsecase)
      : super(const BookStates(
          allBooksState: RequestState.loading,
          searchBooksState: RequestState.loading,
          filteredBooksState: RequestState.loading,
        )) {
    on<GetAllBooksEvent>(_getAllBooks);

    on<SearchBooksEvent>(_searchBooks);

    on<FilteredBooksEvent>(_filterBooks);

    on<LoadMoreDataEvent>(_loadMoreData);
  }








  FutureOr<void> _getAllBooks(
      GetAllBooksEvent event, Emitter<BookStates> emit) async {
    emit(const BookStates(allBooksState: RequestState.loading));

    print('inside all features.books');
    final result = await getAllBooksUsecase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            allBooksState: RequestState.error,
            allBooksMessage: l.message)), (r) {
      emit(state.copyWith(allBooksState: RequestState.loaded, allBooksList: r));
      bookList = r;
    });
  }






  FutureOr<void> _loadMoreData(
      LoadMoreDataEvent event, Emitter<BookStates> emit) async {
    emit(state.copyWith(extraBooksState: RequestState.loading,isMaxScroll: true));


    final result = await extraBooksUsecase(event.pageNumber);

    result.fold(
            (l) => emit(state.copyWith(
            extraBooksState: RequestState.error,
            extraBooksMessage: l.message)),
            (r) {

      emit(state.copyWith(extraBooksState: RequestState.loaded, allBooksList: bookList+r,isMaxScroll: false));
      pageNumber++;
      filterList.addAll(r) ;
    });

  }

  FutureOr<void> _searchBooks(
      SearchBooksEvent event, Emitter<BookStates> emit) async {
    emit(const BookStates(searchBooksState: RequestState.loading));

    print('inside search method');
    final result = await searchBooksUsecase(event.name);

    result.fold(
        (l) => emit(state.copyWith(
            searchBooksState: RequestState.error,
            searchBooksMessage: l.message)), (r) {
      emit(state.copyWith(
          searchBooksState: RequestState.loaded, searchBooksList: r));
      searchList = r;
    });
  }

  FutureOr<void> _filterBooks(
      FilteredBooksEvent event, Emitter<BookStates> emit) async {
    selectedIndex = event.categoryIndex;
    emit(state.copyWith(filteredBooksState: RequestState.loading));

    print('inside filter method with index ${event.categoryIndex}');

    if (event.topic == 'all') {
      print('all');
      emit(state.copyWith(
          filteredBooksState: RequestState.loaded,
          filteredBooksList: bookList));

      filterList = bookList;
    } else {
      final result = await filterBooksUsecase(event.topic);
      emit(state.copyWith(filteredBooksState: RequestState.loaded));

      result.fold(
          (l) => emit(state.copyWith(
              filteredBooksState: RequestState.error,
              filteredBooksMessage: l.message,
              currentCategoryIndex: event.categoryIndex)), (r) {
        emit(state.copyWith(
          filteredBooksState: RequestState.loaded,
          filteredBooksList: r,
        ));
        filterList = r;
      });
    }
  }
}
