import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Colors.blue, // Or your color
    //   statusBarIconBrightness: Brightness.dark, // Or Brightness.dark
    //   systemNavigationBarColor: Colors.blue, // Or your color
    //   systemNavigationBarIconBrightness: Brightness.dark, // Or Brightness.dark
    // ));
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(251, 215, 187, 1),
              Color.fromRGBO(252, 238, 197, 1),
              // Colors.pink.shade200,
              // Colors.pink.shade400,
            ],
          ),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
