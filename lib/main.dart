import 'package:e_books/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'books/presentation/controller/books_bloc.dart';
import 'books/presentation/controller/books_events.dart';
import 'books/presentation/controller/books_states.dart';
import 'books/presentation/screens/books_screen.dart';

void main() {
  ServicesLocator().init();

  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
            create: (BuildContext context) =>
                BookBloc(const BookStates(), sl(), sl(), sl(),sl())
                  ..add(GetAllBooksEvent()))
      ],
      child: MaterialApp(
        title: 'Books Store',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BooksScreen(),
      ),
    );
  }
}
