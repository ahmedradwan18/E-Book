import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(backgroundColor: Colors.transparent,
    content: Center(child: Container(
      color: Colors.transparent,
      height: 120,
      child: Lottie.asset('assets/lotties/loader.json'),)),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
