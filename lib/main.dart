import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazendeals/appwrite_account.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/login_screen.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blue, // Fully blue status bar
      // statusBarIconBrightness: Brightness.dark, // Adjust for light/dark theme
      systemNavigationBarColor: Colors.blue, // blue nav bar
      // systemNavigationBarIconBrightness: Brightness.dark, // Adjust icon color
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isUserAuthenticated() {
  User? user;

  void checkUser() async {
    Account account = AppwriteAccount.getAccount;
    try {
      final loggedInUser = await account.get();
      setState(() {
        user = loggedInUser;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    checkUser();
    print(user.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => WishlistCubit(),
        )
      ],
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
        child: MaterialApp(
          theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                iconColor: Colors.black,
                backgroundColor: const Color.fromRGBO(251, 215, 187, 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
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
          home: user == null ? const LoginScreen() : const HomeScreen(),
          // home: const HomeScreen(),
        ),
      ),
    );
  }
}
