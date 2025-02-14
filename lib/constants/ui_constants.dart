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
}
