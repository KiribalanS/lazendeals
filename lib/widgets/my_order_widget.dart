import 'package:flutter/material.dart';

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: mediaQuery.height * 0.05,
          width: mediaQuery.width * 0.20,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/sweet.png"),
          ),
        ),
        const Column(
          children: [
            Text("Delivered on MM DD"),
            Text("Rice flour"),
            Row(
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
            Text("Rate this product now."),
          ],
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
