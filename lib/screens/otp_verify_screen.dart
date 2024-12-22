import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lazendeals/screens/otp_result_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

class OtpVerifyScreen extends StatelessWidget {
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                "OTP verification",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Enter the otp sent to mail@mail.com"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OtpTextField(
                  numberOfFields: 5,
                  showFieldAsBox: true,
                  borderWidth: 3,
                  fieldWidth: 40,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade200,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         title: const Text("Verification Code"),
                    //         content: Text('Code entered is $verificationCode'),
                    //       );
                    //     });
                  }, // end onSubmit
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpResultScreen(),
                    ),
                  );
                },
                child: const Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
