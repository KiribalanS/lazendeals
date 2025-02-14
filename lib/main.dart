import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazendeals/appwrite_account.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/login_screen.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/constants/ui_constants.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:appwrite/appwrite.dart';
import 'package:lazendeals/widgets/custom_container.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
  bool isLoading = false;

  void checkUser() async {
    setState(() {
      isLoading = true;
    });
    Account account = AppwriteAccount.getCloudAccount;
    try {
      final loggedInUser = await account.get();
      setState(() {
        user = loggedInUser;
      });
    } catch (e) {
      print(e.toString());
    }
    setState(() {
      isLoading = false;
    });
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
                backgroundColor: const Color.fromARGB(255, 236, 173, 125),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
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
          home: isLoading
              ? Scaffold(
                  body: CustomContainer(
                    child: SafeArea(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                UiConstants.logoImage,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    "Lazendeals",
                                    textAlign: TextAlign.center,
                                    style:
                                        GoogleFonts.cinzelDecorative().copyWith(
                                      color: Colors.black,
                                      fontSize: 37,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                  Text(
                                    "Session loading...\nPlease wait",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : user == null
                  ? const LoginScreen()
                  : const HomeScreen(),
        ),
      ),
    );
  }
}
