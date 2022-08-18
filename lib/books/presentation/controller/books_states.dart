import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class BookStates extends Equatable {
  // AllBooks Request states
  final List<Book> allBooksList;
  final RequestState allBooksState;
  final String allBooksMessage;

  // SearchBooks Request states
  final List<Book> searchBooksList;
  final RequestState searchBooksState;
  final String searchBooksMessage;

  // Filtered Books Request states
  final List<Book> filteredBooksList;
  final RequestState filteredBooksState;
  final String filteredBooksMessage;

  // Extra Books states
  final bool isMaxScroll;
  final List<Book> extraBooksList;
  final RequestState extraBooksState;
  final String extraBooksMessage;

  const BookStates({
    this.allBooksList = const [],
    this.isMaxScroll = false,
    this.extraBooksList = const [],
    this.extraBooksState = RequestState.initial,
    this.extraBooksMessage = '',
    this.allBooksState = RequestState.loading,
    this.allBooksMessage = '',
    this.searchBooksList = const [],
    this.searchBooksMessage = '',
    this.searchBooksState = RequestState.loading,
    this.filteredBooksList = const [],
    this.filteredBooksMessage = '',
    this.filteredBooksState = RequestState.loading,
  });

  BookStates copyWith(
      {List<Book>? allBooksList,
      RequestState? allBooksState,
      String? allBooksMessage,
      List<Book>? searchBooksList,
      RequestState? searchBooksState,
      String? searchBooksMessage,
      List<Book>? filteredBooksList,
      RequestState? filteredBooksState,
      String? filteredBooksMessage,
      int? currentCategoryIndex,
      bool? isMaxScroll,
      List<Book>? extraBooksList,
      RequestState? extraBooksState,
      String? extraBooksMessage}) {
    return BookStates(
        allBooksState: allBooksState ?? this.allBooksState,
        allBooksList: allBooksList ?? this.allBooksList,
        allBooksMessage: allBooksMessage ?? this.allBooksMessage,
        searchBooksList: searchBooksList ?? this.searchBooksList,
        searchBooksMessage: searchBooksMessage ?? this.searchBooksMessage,
        searchBooksState: searchBooksState ?? this.searchBooksState,
        filteredBooksList: filteredBooksList ?? this.filteredBooksList,
        filteredBooksMessage: filteredBooksMessage ?? this.filteredBooksMessage,
        filteredBooksState: filteredBooksState ?? this.filteredBooksState,
       isMaxScroll: isMaxScroll ?? this.isMaxScroll,
        extraBooksList: extraBooksList ?? this.extraBooksList,
        extraBooksMessage: extraBooksMessage ?? this.extraBooksMessage,
        extraBooksState: extraBooksState ?? this.extraBooksState);
  }

  @override
  List<Object?> get props => [
        allBooksList,
        allBooksState,
        allBooksMessage,
        searchBooksList,
        searchBooksMessage,
        searchBooksState,
        filteredBooksMessage,
        filteredBooksList,
        filteredBooksState,
        isMaxScroll
      ];
}
