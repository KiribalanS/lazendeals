import 'package:flutter/material.dart';
import 'package:lazendeals/models/dummy.dart';

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ad.jpeg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border(
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              bottom: BorderSide(width: 2),
            ),
          ),
          height: mediaQuery.height * 0.12,
          width: mediaQuery.width * 0.25,
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              height: 37,
              width: constraints.maxWidth,
              color: const Color.fromRGBO(251, 215, 187, 1),
              child: Center(
                child: Text(
                  dummyProduct[0].productName,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: SizedBox(
            width: mediaQuery.width * .56,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  dummyProduct[0].description,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "Quantity : 500g",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "Price : Rs 1000",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 25,
        ),
      ],
    );
  }
}
