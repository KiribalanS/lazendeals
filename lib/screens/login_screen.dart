import 'package:flutter/material.dart';
import 'package:lazendeals/screens/otp_verify_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

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
              const CircleAvatar(
                radius: 55,
                child: Icon(
                  Icons.ac_unit_rounded,
                  size: 75,
                ),
              ),
              const Text(
                "Lazendeals",
                style: TextStyle(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFormField(
                      controller: nameController,
                      icon: const Icon(Icons.mail),
                      text: "Your name",
                    ),
                    CustomFormField(
                      controller: phoneNumberController,
                      icon: const Icon(Icons.mail),
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
                  Navigator.push(
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

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.text,
    required this.controller,
    required this.icon,
  });
  final TextEditingController controller;
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 5,
        ),
        child: Center(
          child: SizedBox(
            width: mediaQuery.width * 0.85,
            child: TextFormField(
              validator: (value) {
                if (value == "") {
                  return "please fill all the fields";
                }
                return null;
              },
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                border: const OutlineInputBorder(),
                suffixIcon: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
