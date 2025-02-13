import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar customAppBar(GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        size: 32,
        color: Colors.black,
      ),
      onPressed: () => scaffoldKey.currentState?.openDrawer(),
    ),
    title: const Text(
      "Lazendeals",
      style: TextStyle(
        fontSize: 37,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          size: 35,
          color: Colors.black,
        ),
      ),
    ],
  );
}
