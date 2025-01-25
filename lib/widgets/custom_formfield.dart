import 'package:flutter/material.dart';

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
