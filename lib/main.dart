import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/login_screen.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'http://192.168.0.138:8001',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // bool isUserAuthenticated() {
  //   final user = Supabase.instance.client.auth.currentUser;
  //   return user != null; // Returns true if a user is logged in
  // }

  @override
  Widget build(BuildContext context) {
    // isUserAuthenticated();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
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
        home: StreamBuilder(
          stream: Supabase.instance.client.auth.onAuthStateChange,
          builder: (context, snapshot) {
            final user = Supabase.instance.client.auth.currentUser;

            if (user != null) {
              return const HomeScreen();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
