import 'package:e_books/core/utils/app_constatnts.dart';
import 'package:flutter/material.dart';


// We need statefull widget because we are gonna change some state on our category
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected
  int selectedIndex = 0;
  List categories = ['All', 'Classics', 'Horror', 'Fantasy','Romance',];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical:AppConstants. kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: AppConstants.kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? AppConstants.kDefaultPadding : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPadding),
            decoration: BoxDecoration(
              color: index == selectedIndex
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
    );
  }
}
