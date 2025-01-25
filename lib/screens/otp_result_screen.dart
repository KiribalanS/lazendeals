import 'package:flutter/material.dart';
import 'package:lazendeals/screens/welcome_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

class OtpResultScreen extends StatelessWidget {
  const OtpResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const CircleAvatar(
              radius: 55,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    height: 75,
                    width: 75,
                    image: AssetImage("assets/images/message.png"),
                  ),
                  const Text(
                    "OTP verified",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "your account has been verified successfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: const Text("Done"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
