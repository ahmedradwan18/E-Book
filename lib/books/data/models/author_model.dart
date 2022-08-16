import 'package:e_books/books/domain/entities/author.dart';


class AuthorModel extends Author {
  const AuthorModel({
    required authorName,
    required birthYear,
    required deathYear,
  }) : super(
            authorName: authorName, birthYear: birthYear, deathYear: deathYear);

  factory AuthorModel.fromJson(Map<String, dynamic> json) {

  return   AuthorModel(
        authorName: json['name'] ?? '',
        birthYear: json['birth_year'] ?? 0,
        deathYear: json['death_year'] ?? 0);
  }
}
