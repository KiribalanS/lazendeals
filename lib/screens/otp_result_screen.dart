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
            const CircleAvatar(
              radius: 55,
              child: Icon(
                Icons.message,
                size: 75,
              ),
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
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
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
