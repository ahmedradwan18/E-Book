import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_books/books/data/models/book_model.dart';
import 'package:e_books/books/domain/entities/book.dart';
import 'package:e_books/core/utils/app_constatnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemIndex,
    required this.book,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Book book;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.kDefaultPadding,
        vertical: AppConstants.kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        //  onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: itemIndex.isEven
                    ? AppConstants.kBlueColor
                    : AppConstants.kSecondaryColor,
                boxShadow: const [AppConstants.kDefaultShadow],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '${book.id}',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kDefaultPadding),
                  height: 160,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  child:CachedNetworkImage(
                    imageUrl: book.coverImage,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.kDefaultPadding),
                      child: Text(
                        book.title,maxLines: 4,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kDefaultPadding * 1.5,
                        // 30 padding
                        vertical: AppConstants.kDefaultPadding /
                            4, // 5 top and bottom
                      ),width: 150,
                      decoration: const BoxDecoration(
                        color: AppConstants.kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        book.author[0].authorName,maxLines: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        // style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class FakeProductCard extends StatelessWidget {
  final int itemIndex;

  const FakeProductCard({
    Key? key,
    required this.itemIndex,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.kDefaultPadding,
        vertical: AppConstants.kDefaultPadding / 2,
      ),
      // color: Colors.blueAccent,
      height: 160,
      child: InkWell(
        //  onTap: press,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Those are our background
            Container(
              height: 136,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: itemIndex.isEven
                    ? AppConstants.kBlueColor
                    : AppConstants.kSecondaryColor,
                boxShadow: const [AppConstants.kDefaultShadow],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // our product image
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: '${'book.id'}',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kDefaultPadding),
                  height: 160,
                  // image is square but we add extra 20 + 20 padding thats why width is 200
                  width: 200,
                  child: Icon(Icons.add),
                ),
              ),
            ),
            // Product title and price
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                // our image take 200 width, thats why we set out total width - 200
                width: size.width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.kDefaultPadding),
                      child: Text(
                        'book.title',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // it use the available space
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.kDefaultPadding * 1.5,
                        // 30 padding
                        vertical: AppConstants.kDefaultPadding /
                            4, // 5 top and bottom
                      ),
                      decoration: const BoxDecoration(
                        color: AppConstants.kSecondaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                      child: Text(
                        "",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
