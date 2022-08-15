import 'package:e_books/core/services/services_locator.dart';
import 'package:flutter/material.dart';

import 'books/presentation/screens/books_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books Store',debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const BooksScreen(),
    );
  }
}

