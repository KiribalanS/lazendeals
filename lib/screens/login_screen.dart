import 'package:flutter/material.dart';
import 'package:lazendeals/screens/otp_verify_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';
import 'package:lazendeals/widgets/custom_formfield.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomContainer(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Image(
                height: 115,
                width: 115,
                image: AssetImage("assets/images/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Lazendeals",
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFormField(
                      controller: nameController,
                      icon: const Icon(Icons.person),
                      text: "Your name",
                    ),
                    CustomFormField(
                      controller: phoneNumberController,
                      icon: const Icon(Icons.phone),
                      text: "Your phone number",
                    ),
                    CustomFormField(
                      controller: emailController,
                      icon: const Icon(Icons.mail),
                      text: "Your mail",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpVerifyScreen(),
                    ),
                  );
                },
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
