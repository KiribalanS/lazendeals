import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(251, 215, 187, 1),
          elevation: 4, // Shadow under the AppBar
          centerTitle: true, // Centers the title
          titleTextStyle: GoogleFonts.cinzelDecorative().copyWith(
            color: Colors.black,
            fontSize: 37,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
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
