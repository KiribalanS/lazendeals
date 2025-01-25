import 'package:flutter/material.dart';
import 'package:lazendeals/screens/get_address_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomContainer(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 55,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
            Text(
              "Lazendeals",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Welcome to Lazendeals",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 85,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetAddressScreen(),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('skip'),
        ),
      ),
    );
  }
}
