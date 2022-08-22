import 'package:dartz/dartz.dart';
import 'package:e_books/features/books/domain/entities/book.dart';

import 'package:hive_flutter/hive_flutter.dart';

abstract class BaseBookLocalDataSource {
  Future<List<Book>> getCachedBooks(Box box);

  Future<Box> openBox();

  Future<void> cacheBooks(Box box, List<Book> booksList);

  Future<void> clearCachedPosts(Box box);
}


class BookLocalDataSource extends BaseBookLocalDataSource {
  String boxName = 'books_list';

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Book>(boxName);
    return box;
  }

  @override
  Future<void> cacheBooks(Box box, List<Book> booksList) async {
    for (Book book in booksList) {
      await box.put(book.id, book);
    }
  }

  @override
  Future<List<Book>> getCachedBooks(Box box) async {

    return box.values.toList() as List<Book>;
  }

  @override
  Future<void> clearCachedPosts(Box box) async {
    await box.clear();
  }
}
