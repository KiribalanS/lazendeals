import 'package:flutter/material.dart';
import 'package:lazendeals/screens/home_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

enum Gender { male, female }

class GetAddressScreen extends StatefulWidget {
  const GetAddressScreen({super.key});

  @override
  State<GetAddressScreen> createState() => _GetAddressScreenState();
}

class _GetAddressScreenState extends State<GetAddressScreen> {
  Gender? character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Personal information",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Text(
                      "Address",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .95,
                      child: const TextField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your Address here"),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Pin code",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .95,
                      child: const TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter your Pincode here"),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Gender",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    ListTile(
                      title: const Text('male'),
                      leading: Radio<Gender>(
                        value: Gender.male,
                        groupValue: character,
                        onChanged: (Gender? value) {
                          setState(() {
                            character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Female'),
                      leading: Radio<Gender>(
                        value: Gender.female,
                        groupValue: character,
                        onChanged: (Gender? value) {
                          setState(() {
                            character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        },
        child: const Text("Next"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
