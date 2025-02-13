import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/otp_verify_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';
import 'package:lazendeals/auth/widgets/custom_formfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Or your color
        statusBarIconBrightness: Brightness.light, // Or Brightness.dark
        systemNavigationBarColor: Colors.transparent, // Or your color
        systemNavigationBarIconBrightness:
            Brightness.light, // Or Brightness.dark
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            print("Initial state emitted");
            if (state is AuthInitial) {
              print("Initial state");
            }
            if (state is AuthOtpSentState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "OTP sent successfully to your mail",
                  ),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpVerifyScreen(
                    email: emailController.text.trim(),
                  ),
                ),
              );
            }
            if (state is AuthFailureState) {
              print(state.failureMessage);
              print("state.failureMessage");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.failureMessage.toString(),
                  ),
                ),
              );
            }
          },
          builder: (ctx, state) {
            return CustomContainer(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Image(
                      height: 115,
                      width: 115,
                      image: AssetImage("assets/images/logo.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Lazendeals",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).appBarTheme.titleTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.58,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomFormField(
                            controller: nameController,
                            icon: const Icon(Icons.person),
                            text: "Your name",
                            callback: (value) {
                              if (value == "") {
                                return "please fill the name field";
                              }
                              if (nameController.text.trim().length < 3) {
                                return "Please enter a valid name (name > 3)";
                              }
                              return null;
                            },
                          ),
                          CustomFormField(
                            controller: phoneNumberController,
                            icon: const Icon(Icons.phone),
                            text: "Your phone number",
                            callback: (value) {
                              if (value == "") {
                                return "please fill the phone number field";
                              }
                              if (nameController.text.trim().length < 3) {
                                return "Please enter a phone number (number == 10)";
                              }
                              return null;
                            },
                          ),
                          CustomFormField(
                            controller: emailController,
                            icon: const Icon(Icons.mail),
                            text: "Your mail",
                            callback: (value) {
                              if (value == "") {
                                return "please fill the mail field";
                              }
                              if (nameController.text.trim().length < 3) {
                                return "Please enter a valid mail";
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ctx.read<AuthBloc>().add(
                                AuthLoginEvent(
                                  email: emailController.text.trim(),
                                  name: nameController.text.trim(),
                                  phone: phoneNumberController.text.trim(),
                                ),
                              );
                        }
                      },
                      child: const Text("Login"),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
