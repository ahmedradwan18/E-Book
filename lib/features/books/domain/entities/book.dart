
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'author.dart';


part 'book.g.dart';

@HiveType(typeId: 0)

class Book extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int downloadCount;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String coverImage;
  @HiveField(4)
  final List<Author>? author;

  const Book(
      {required this.id,
      required this.downloadCount,
      required this.title,
      required this.coverImage,
       this.author});

  @override
  List<Object?> get props => [id, downloadCount, title, coverImage, author];
}
