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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  //List<Book> books = [];
  String searchedName = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) {
      return BookBloc(const BookStates(), sl(), sl())
        ..add(GetAllBooksEvent()) ;
    }, child: BlocBuilder<BookBloc, BookStates>(
    //  buildWhen: (previous,current,)=>previous.allBooksState!=current.allBooksState,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppConstants.kPrimaryColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                SearchBox(
                    onChanged: (value) {
                  searchedName=value;

                  if (value != '') {
                    BlocProvider.of<BookBloc>(context)
                        .add(SearchBooksEvent(value));
                  } else {
                    BlocProvider.of<BookBloc>(context).add(GetAllBooksEvent());
                  }
                }),
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

                      (state.allBooksState == RequestState.loading &&
                              state.searchBooksState == RequestState.loading)
                          ? Shimmer.fromColors(
                              baseColor: const Color(0xffc6c6c6),
                              highlightColor: Colors.blue.withOpacity(0.4),
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) =>
                                    FakeProductCard(
                                  itemIndex: index,
                                ),
                              ))
                          : (state.searchBooksList.isEmpty && searchedName!='')
                              ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          child: Lottie.asset('assets/lotties/noBooks.json'),height: 350,),
                                      const Text('No books found by that name..',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppConstants.kPrimaryColor),)
                                    ],
                                  ),
                                ),
                              )
                              : ListView.builder(
                                  itemCount: BlocProvider.of<BookBloc>(context)
                                          .searchList
                                          .isEmpty
                                      ? state.allBooksList.length
                                      : BlocProvider.of<BookBloc>(context)
                                          .searchList
                                          .length,
                                  itemBuilder: (context, index) => ProductCard(
                                    itemIndex: index,
                                    press: () {},
                                    book: BlocProvider.of<BookBloc>(context)
                                            .searchList
                                            .isEmpty
                                        ? state.allBooksList[index]
                                        : BlocProvider.of<BookBloc>(context)
                                            .searchList[index],
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
