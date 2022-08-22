
import 'package:e_books/core/utils/app_constatnts.dart';
import 'package:e_books/core/utils/enums.dart';
import 'package:e_books/core/utils/shared/loader_dialog.dart';
import 'package:e_books/features/books/presentation/controller/books_bloc.dart';
import 'package:e_books/features/books/presentation/controller/books_events.dart';
import 'package:e_books/features/books/presentation/controller/books_states.dart';
import 'package:e_books/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected

  List categories = [
    'All',
    'Children',
    'Fiction',
    'Science',
    'Sport',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookBloc, BookStates>(
        listener: (context, state) {
          if (state.filteredBooksState == RequestState.loaded) {
print('aaaaaaaaaaaaalll');
              Navigator.maybePop(context);
          }

        },
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: AppConstants.kDefaultPadding / 2),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                if(index!=0){
                  showLoaderDialog(context);
                }


                BlocProvider.of<BookBloc>(context).add( FilteredBooksEvent(
                    categories[index].toString().toLowerCase(), index));


                 //  Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  left: AppConstants.kDefaultPadding,
                  // At end item it add extra 20 right  padding
                  right: index == categories.length - 1
                      ? AppConstants.kDefaultPadding
                      : 0,
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.kDefaultPadding),
                decoration: BoxDecoration(
                  color:
                      index == BlocProvider.of<BookBloc>(context).selectedIndex
                          ? Colors.white.withOpacity(0.4)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  categories[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ));

/*      Container(
      margin: const EdgeInsets.symmetric(
          vertical: AppConstants.kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () async{

          //  BlocProvider.of<BookBloc>(context).state.filteredBooksState==RequestState.loading?  showLoaderDialog(context):


            showLoaderDialog(context);

            BlocProvider.of<BookBloc>(context).add(FilteredBooksEvent(
                categories[index].toString().toLowerCase(), index));
            Navigator.pop(context);

            */ /*  if(BlocProvider.of<BookBloc>(context).state.filteredBooksState==RequestState.loaded) {
              Navigator.pop(context);
            }*/ /*
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: AppConstants.kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1
                  ? AppConstants.kDefaultPadding
                  : 0,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.kDefaultPadding),
            decoration: BoxDecoration(
              color: index == BlocProvider.of<BookBloc>(context).selectedIndex
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );*/
  }
}
