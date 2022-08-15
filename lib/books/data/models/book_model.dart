import 'package:e_books/books/data/models/author_model.dart';
import 'package:e_books/books/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required id,
    required downloadCount,
    required title,
    required coverImage,
    required author,
  }) : super(
            downloadCount: downloadCount,
            coverImage: coverImage,
            author: author,
            title: title,
            id: id);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['title'],
        author:
        parseItems(json)

        //AuthorModel.fromJson(json['authors'])

/*        List<AuthorModel>.from(json['authors'].map((x) {
          print('radwan $x');
          return AuthorModel.fromJson(x);
        }))*/
        ,
        coverImage: json['formats']['image/jpeg'],
        downloadCount: json['download_count']);
  }

  static List<AuthorModel>? parseItems(sportsJson) {
    var list = sportsJson['authors'] as List;
    if (list != null) {
      List<AuthorModel> authorsList =
      list.map((data) => AuthorModel.fromJson(data)).toList();
      print('***** ${list.length}');
      return authorsList;
    }else{
      print('---- ${list.length}');
    }
  }



}
