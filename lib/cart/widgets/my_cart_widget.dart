import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/models/product_model.dart';

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({required this.productModel, super.key});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/ad.jpeg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(width: 2),
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
            Positioned(
              right: 1,
              top: 2,
              child: IconButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                        RemoveCartEvent(
                          context: context,
                          productModel: dummyProduct[0],
                        ),
                      );
                },
                icon: const Icon(
                  Icons.delete,
                  size: 28,
                  color: Colors.red,
                ),
              ),
            ),
          ],
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
