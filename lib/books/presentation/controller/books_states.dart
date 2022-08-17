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


  const BookStates(
      {this.allBooksList = const [],
      this.allBooksState = RequestState.loading,
      this.allBooksMessage = '',
      this.searchBooksList = const [],
      this.searchBooksMessage = '',
      this.searchBooksState = RequestState.loading,
      this.filteredBooksList = const [],
      this.filteredBooksMessage = '',
      this.filteredBooksState = RequestState.loading,
     // this.currentCategoryIndex = 0
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
      int? currentCategoryIndex
      }) {
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
       // currentCategoryIndex: currentCategoryIndex?? this.currentCategoryIndex
        );
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
      //  currentCategoryIndex
      ];
}
