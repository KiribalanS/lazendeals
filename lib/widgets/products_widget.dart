import 'package:flutter/material.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/screens/product_details_screen.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/ad.jpeg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border(
                        left: BorderSide(width: 2),
                        right: BorderSide(width: 2),
                        top: BorderSide(width: 2),
                        bottom: BorderSide(width: 2),
                      ),
                    ),
                    height: mediaQuery.height * 0.12,
                    width: mediaQuery.width * 0.27,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        height: 37,
                        width: constraints.maxWidth,
                        color: const Color.fromRGBO(251, 215, 187, 1),
                        child: Center(
                          child: Text(
                            productModel.productName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
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
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: SizedBox(
                  width: mediaQuery.width * .49,
                  child: Column(
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        productModel.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(251, 215, 187, 1)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailsScreen(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            width: 130,
                            child: Text(
                              "Add to Cart",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(251, 215, 187, 1)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ProductDetailsScreen(),
                              ),
                            );
                          },
                          child: const SizedBox(
                            width: 130,
                            child: Text(
                              "Buy Now",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 25,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined),
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
