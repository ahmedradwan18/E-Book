import 'dart:ui';
import 'package:e_books/books/presentation/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: const Color(0xffffffff),
        highlightColor: Colors.grey.withOpacity(0.4),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) =>
              FakeProductCard(
                itemIndex: index,
              ),
        ));
  }
}