import 'package:flutter/material.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:lazendeals/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(251, 215, 187, 1),
          elevation: 4, // Shadow under the AppBar
          centerTitle: true, // Centers the title
          // titleTextStyle: TextStyle(
          //   color: Colors.white, // Title text color
          //   fontSize: 20, // Title font size
          //   fontWeight: FontWeight.bold, // Title font weight
          // ),
          iconTheme: IconThemeData(
            color: Colors.white, // Icon color
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: HomeScreen(),
    );
  }
}
