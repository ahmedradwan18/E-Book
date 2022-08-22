
import 'package:e_books/core/services/services_locator.dart';
import 'package:e_books/features/books/domain/entities/author.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'features/books/domain/entities/author.dart';
import 'features/books/domain/entities/book.dart';
import 'features/books/presentation/controller/books_bloc.dart';
import 'features/books/presentation/controller/books_events.dart';
import 'features/books/presentation/controller/books_states.dart';
import 'features/books/presentation/screens/books_screen.dart';
import 'features/network_connectivity_bloc/network_bloc.dart';
import 'features/network_connectivity_bloc/network_events.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  Hive.registerAdapter(AuthorAdapter());
  ServicesLocator().init();

  runApp(const MyApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isConnected=true;
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          isConnected=true;
          BlocProvider.of<NetworkBloc>(navigatorKey.currentState!.context).add(NetworkStatusChangeEvent(true));
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          isConnected=false;
          BlocProvider.of<NetworkBloc>(navigatorKey.currentState!.context).add(NetworkStatusChangeEvent(false));
          print('You are disconnected from the internet.');
          break;
      }
    });

    return MultiBlocProvider(
      providers: [
        BlocProvider<BookBloc>(
            create: (BuildContext context) =>
                BookBloc(const BookStates(), sl(), sl(), sl(),sl())
                  ..add(GetAllBooksEvent())),

        BlocProvider<NetworkBloc>(
            create: (BuildContext context) =>
            NetworkBloc(isConnected)),
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
