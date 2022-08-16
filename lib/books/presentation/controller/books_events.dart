import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable{
  const BooksEvent();

  @override
  List<Object> get props =>[];
}

class GetAllBooksEvent extends BooksEvent{

}


class SearchBooksEvent extends BooksEvent{
  final String name;

  const SearchBooksEvent(this.name);

  @override
  List<Object> get props =>[name];
}