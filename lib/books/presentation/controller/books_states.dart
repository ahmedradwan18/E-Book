import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class BookStates extends Equatable {
  // AllBooks Request
  final List<Book> allBooksList;
  final RequestState allBooksState;
  final String allBooksMessage;

  const BookStates(
      {this.allBooksList = const [],
      this.allBooksState = RequestState.loading,
      this.allBooksMessage = ''});

  BookStates copyWith(
      {List<Book>? allBooksList,
      RequestState? allBooksState,
      String? allBooksMessage}) {
    return BookStates(
        allBooksState: allBooksState ?? this.allBooksState,
        allBooksList: allBooksList ?? this.allBooksList,
        allBooksMessage: allBooksMessage ?? this.allBooksMessage);
  }

  @override
  List<Object?> get props => [allBooksList, allBooksState, allBooksMessage];
}
