import 'package:flutter/material.dart';

class UiConstants {
  static void showCustomSnackbars(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  static const logoImage = Image(
    height: 115,
    width: 115,
    image: AssetImage("assets/images/logo.png"),
  );
}
