import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/login_screen.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:appwrite/appwrite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   // url: 'http://192.168.0.138:8001',
  //   url: 'http://192.168.1.4:8001',
  //   anonKey:
  //       'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  // );

  final client = Client()
      .setEndpoint('http://192.168.0.138:90/v1')
      .setProject('67a2eed900152c3e373b')
      .setSelfSigned(status: true);
  runApp(MyApp(client: client));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.client});
  final Client client;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool isUserAuthenticated() {
  var user;

  void checkUser() async {
    Account account = Account(widget.client);

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
  }

  @override
  Widget build(BuildContext context) {
    // isUserAuthenticated();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => CartBloc(),
        ),
      ],
      child: MaterialApp(
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
        // home: StreamBuilder(
        //  stream: Supabase.instance.client.auth.onAuthStateChange,

        //   builder: (context, snapshot) {
        //     final user = Supabase.instance.client.auth.currentUser;

        //     if (user != null) {
        //       return const HomeScreen();
        //     } else {
        //       return const LoginScreen();
        //     }
        //   },
        // ),

        home: user == null ? const LoginScreen() : const HomeScreen(),
      ),
    );
  }
}
