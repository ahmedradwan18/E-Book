import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable{
  const BooksEvent();

  @override
  List<Object> get props =>[];
}

class GetAllBooksEvent extends BooksEvent{

}


class GetUnKnownBooksEvent extends BooksEvent{

}