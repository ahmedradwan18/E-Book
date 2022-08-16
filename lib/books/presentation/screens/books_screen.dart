import 'package:e_books/books/data/datasource/book_remote_datasource.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/books/data/repository/books_repository.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/books/domain/repository/base_book_repository.dart';
import 'package:e_books/books/domain/usecases/get_all_books_usecase.dart';
import 'package:e_books/books/presentation/components/body.dart';
import 'package:e_books/books/presentation/components/category_list.dart';
import 'package:e_books/books/presentation/components/product_card.dart';
import 'package:e_books/books/presentation/controller/books_bloc.dart';
import 'package:e_books/books/presentation/controller/books_events.dart';
import 'package:e_books/books/presentation/controller/books_states.dart';
import 'package:e_books/core/services/services_locator.dart';
import 'package:e_books/core/utils/app_constatnts.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:e_books/core/utils/shared/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return BookBloc(const BookStates(), sl())..add(GetAllBooksEvent());
    }, child: BlocBuilder<BookBloc, BookStates>(
    //  buildWhen: (previous,current,)=>previous.allBooksState!=current.allBooksState,
      builder: (context, state) {

        return Scaffold(
          backgroundColor: AppConstants.kPrimaryColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                SearchBox(onChanged: (value) {}),
                CategoryList(),
                const SizedBox(height: AppConstants.kDefaultPadding / 2),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      // Our background
                      Container(
                        margin: const EdgeInsets.only(top: 70),
                        decoration: const BoxDecoration(
                          color: AppConstants.kBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                      ),

                      state.allBooksState == RequestState.loading
                          ? Shimmer.fromColors(
                              baseColor: const Color(0xffc6c6c6),
                              highlightColor: Colors.blue.withOpacity(0.4),
                              child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) => FakeProductCard(
                                  itemIndex: index,

                                ),
                              ))
                          : ListView.builder(
                              itemCount: state.allBooksList.length,
                              itemBuilder: (context, index) => ProductCard(
                                itemIndex: index,
                                press: () {},
                                book: state.allBooksList[index],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const Text('Dashboard'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }
}
