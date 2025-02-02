import 'package:flutter/material.dart';
import 'package:lazendeals/screens/continue_shopping.dart';

class CustomPaymentMethodWidget extends StatelessWidget {
  const CustomPaymentMethodWidget({
    super.key,
    required this.content,
  });
  final String content;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ContinueShopping(),
              ));
        },
        child: Center(
          child: Container(
            width: mediaQuery.width * .85,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    content,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_downward_sharp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
