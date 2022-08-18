import 'package:e_books/books/presentation/components/category_list.dart';
import 'package:e_books/books/presentation/components/product_card.dart';
import 'package:e_books/books/presentation/components/shimmer.dart';
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

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  String searchedName = '';
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          BlocProvider.of<BookBloc>(context).add( LoadMoreDataEvent(BlocProvider.of<BookBloc>(context).pageNumber+1));
          print('At the bottom');
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    print('inside build');
    return BlocBuilder<BookBloc, BookStates>(
      builder: (context, state) {
        print('tate now iss $state');
        return Scaffold(
          backgroundColor: AppConstants.kPrimaryColor,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                SearchBox(onChanged: (value) async {
                  searchedName = value;
                  await Future.delayed(const Duration(milliseconds: 300));
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
                              state.searchBooksState == RequestState.loading &&
                              state.filteredBooksState == RequestState.loading)
                          ? const ShimmerWidget()
                          : (state.searchBooksList.isEmpty &&
                                  searchedName != '' &&
                                  state.filteredBooksList.isEmpty)
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Lottie.asset(
                                              'assets/lotties/noBooks.json'),
                                          height: 350,
                                        ),
                                        const Text(
                                          'No books found..',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color:
                                                  AppConstants.kPrimaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      shrinkWrap: true,
                          controller: _controller,
                                        itemCount: BlocProvider.of<BookBloc>(context)
                                                .searchList
                                                .isNotEmpty
                                            ? BlocProvider.of<BookBloc>(context)
                                                .searchList
                                                .length
                                            : BlocProvider.of<BookBloc>(context)
                                                    .filterList
                                                    .isNotEmpty
                                                ? BlocProvider.of<BookBloc>(context)
                                                    .filterList
                                                    .length
                                                : state.allBooksList.length,
                                        itemBuilder: (context, index) => ProductCard(
                                          itemIndex: index,
                                          press: () {},


                                          book: BlocProvider.of<BookBloc>(context).searchList.isNotEmpty ?  BlocProvider.of<BookBloc>(context).searchList[index] :
                                                BlocProvider.of<BookBloc>(context).filterList.isNotEmpty ?  BlocProvider.of<BookBloc>(context).filterList[index] :
                                               state.allBooksList[index]


                                        ),
                                      ),
                                  ),
                                  (state.isMaxScroll)? const CircularProgressIndicator():Container()
                                ],
                              ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
