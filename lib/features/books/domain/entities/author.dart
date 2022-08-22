import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'author.g.dart';

@HiveType(typeId: 1)
class Author extends Equatable{
  @HiveField(0)
  final String authorName;
  @HiveField(1)
  final int birthYear;
  @HiveField(2)
  final int deathYear;

  const Author({required this.authorName,required this.birthYear,required this.deathYear});

  @override
  List<Object?> get props => [authorName,birthYear,deathYear];



}