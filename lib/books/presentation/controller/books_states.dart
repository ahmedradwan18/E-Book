import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class BookStates extends Equatable {
  // AllBooks Request
  final List<Book> allBooksList;
  final RequestState allBooksState;
  final String allBooksMessage;

  // SearchBooks Request
  final List<Book> searchBooksList;
  final RequestState searchBooksState;
  final String searchBooksMessage;

  const BookStates(
      {this.allBooksList = const [],
      this.allBooksState = RequestState.loading,
      this.allBooksMessage = '',
      this.searchBooksList = const [],
      this.searchBooksMessage = '',
      this.searchBooksState = RequestState.loading});

  BookStates copyWith(
      {List<Book>? allBooksList,
      RequestState? allBooksState,
      String? allBooksMessage,
      List<Book>? searchBooksList,
      RequestState? searchBooksState,
      String? searchBooksMessage}) {
    return BookStates(
        allBooksState: allBooksState ?? this.allBooksState,
        allBooksList: allBooksList ?? this.allBooksList,
        allBooksMessage: allBooksMessage ?? this.allBooksMessage,
        searchBooksList: searchBooksList ?? this.searchBooksList,
        searchBooksMessage: searchBooksMessage ?? this.searchBooksMessage,
        searchBooksState: searchBooksState ?? this.searchBooksState);
  }

  @override
  List<Object?> get props => [
        allBooksList,
        allBooksState,
        allBooksMessage,
        searchBooksList,
        searchBooksMessage,
        searchBooksState
      ];
}
