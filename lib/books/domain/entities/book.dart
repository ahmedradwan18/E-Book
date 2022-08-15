import 'package:e_books/books/data/models/author_model.dart';
import 'package:e_books/books/domain/entities/author.dart';
import 'package:equatable/equatable.dart';



class Book extends Equatable {
  final int id;
  final int downloadCount;
  final String title;
  final String coverImage;
  final List<AuthorModel> author;

  const Book(
      {required this.id,
      required this.downloadCount,
      required this.title,
      required this.coverImage,
      required this.author});

  @override
  List<Object?> get props => [id, downloadCount, title, coverImage, author];
}
