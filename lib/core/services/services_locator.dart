

import 'package:e_books/core/network/network_info.dart';
import 'package:e_books/features/books/data/datasource/book_local_datasource.dart';
import 'package:e_books/features/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/features/books/data/repository/books_repository.dart';
import 'package:e_books/features/books/domain/repository/base_book_repository.dart';
import 'package:e_books/features/books/domain/usecases/filter_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/get_all_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/get_extra_books_usecase.dart';
import 'package:e_books/features/books/domain/usecases/search_books_usecase.dart';
import 'package:e_books/features/books/presentation/controller/books_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl=GetIt.instance;

class ServicesLocator{
  void init(){

    
    /// BLOC
    sl.registerFactory(() => BookBloc(sl(), sl(),sl(),sl(),sl()));
    
    
    /// USE CASES
    sl.registerLazySingleton(() => GetAllBooksUsecase(baseBookRepository: sl()));
    sl.registerLazySingleton(() => SearchBooksUsecase(baseBookRepository: sl()));
    sl.registerLazySingleton(() => FilterBooksUsecase(baseBookRepository: sl()));
    sl.registerLazySingleton(() => GetExtraBooksUsecase(baseBookRepository: sl()));


    /// REPOSITORY
    sl.registerLazySingleton<BaseBookRepository>(() => BooksRepository(baseBookRemoteDataSource: sl(),baseBookLocalDataSource: sl(),networkInfo: sl()));


    /// DATA SOURCE
    sl.registerLazySingleton<BaseBookRemoteDataSource>(() => BookRemoteDataSource());
    sl.registerLazySingleton<BaseBookLocalDataSource>(() => BookLocalDataSource());

    /// CORE
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

    /// EXTERNAL
    sl.registerLazySingleton(() => InternetConnectionChecker());




  }
}