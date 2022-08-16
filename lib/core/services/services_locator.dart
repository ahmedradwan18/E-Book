import 'package:e_books/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/books/data/repository/books_repository.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/books/domain/usecases/get_all_books_usecase.dart';
import 'package:e_books/books/domain/usecases/search_books_usecase.dart';
import 'package:e_books/books/presentation/controller/books_bloc.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

class ServicesLocator{
  void init(){

    
    /// BLOC
    sl.registerFactory(() => BookBloc(sl(), sl(),sl()));
    
    
    /// USE CASES
    sl.registerLazySingleton(() => GetAllBooksUsecase(baseBookRepository: sl()));
    sl.registerLazySingleton(() => SearchBooksUsecase(baseBookRepository: sl()));


    /// REPOSITORY
    sl.registerLazySingleton<BaseBookRepository>(() => BooksRepository(baseBookRemoteDataSource: sl()));


    /// DATA SOURCE
    sl.registerLazySingleton<BaseBookRemoteDataSource>(() => BookRemoteDataSource());



  }
}