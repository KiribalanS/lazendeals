import 'package:flutter/material.dart';
import 'package:lazendeals/screens/product_details_screen.dart';

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/sweet.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          border: Border.all(width: 2.5),
        ),
        height: MediaQuery.of(context).size.height * .2,
        width: MediaQuery.of(context).size.width * .85,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(
                minHeight: 37,
                maxHeight: 45,
              ),
              width: constraints.maxWidth,
              color: const Color.fromRGBO(251, 215, 187, 1),
              child: const Center(
                child: Text(
                  "Tamil Nadu\nSweets and snacks",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
