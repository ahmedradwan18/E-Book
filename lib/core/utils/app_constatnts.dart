import 'package:flutter/material.dart';

class AppConstants{
  static const baseUrl='https://gutendex.com/';
  static const allBooksEndPoint='books/';
  static const searchBooksEndPoint='books?search=';
  static const filterBooksEndPoint='books?topic=';
  static const extraBooksEndPoint='books?page=';


// list of colors that we use in our app
  static const kBackgroundColor = Color(0xFFF1EFF1);
  static const kPrimaryColor = Color(0xFF035AA6);
  static  const kSecondaryColor = Color(0xFFFFA41B);
  static  const kTextColor = Color(0xFF000839);
  static const kTextLightColor = Color(0xFF747474);
  static const kBlueColor = Color(0xFF40BAD5);

  static  const kDefaultPadding = 20.0;

// our default Shadow
  static const kDefaultShadow = BoxShadow(
    offset: Offset(0, 15),
    blurRadius: 27,
    color: Colors.black12, // Black color with 12% opacity
  );

}