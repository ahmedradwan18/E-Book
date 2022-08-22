
import 'package:e_books/core/utils/app_constatnts.dart';
import 'package:e_books/core/utils/shared/search_box.dart';
import 'package:e_books/features/books/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';

import 'category_list.dart';
import 'product_card.dart';

class Body extends StatelessWidget {
  final List<Book> allBooks;

  const Body({Key? key, required this.allBooks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                Shimmer.fromColors( baseColor: const Color(0xffc6c6c6),
                  highlightColor: Colors.blue,
                  child: ListView.builder(
                    itemCount: allBooks.length,
                    itemBuilder: (context, index) => ProductCard(
                      itemIndex: index,
                      press: () {
                      }, book: allBooks[index],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
