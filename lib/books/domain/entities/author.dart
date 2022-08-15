import 'package:equatable/equatable.dart';

class Author extends Equatable{
  final String authorName;
  final int birthYear;
  final int deathYear;

  const Author({required this.authorName,required this.birthYear,required this.deathYear});

  @override
  List<Object?> get props => [authorName,birthYear,deathYear];



}