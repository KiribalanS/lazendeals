import 'package:flutter/material.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: const Text(
          "Lazendeals",
          style: TextStyle(
            fontSize: 37,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              size: 35,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: mediaQuery.height * 0.22,
                width: mediaQuery.width * 0.85,
                child: const Center(
                  child: Text("Advertisments"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    height: mediaQuery.height * 0.32,
                    width: mediaQuery.width * 0.85,
                    child: const Center(
                      child: Text("Products"),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // width: mediaQuery.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (quantity < 2) return;
                                  quantity -= 1;
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                              ),
                            ),
                            Text(
                              "Quantity : $quantity",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity += 1;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mediaQuery.height * 0.1,
                width: mediaQuery.width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "★" * 5,
                          style: const TextStyle(
                            fontSize: 27,
                          ),
                        ),
                        const Text("Overall Star rating"),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    )
                  ],
                ),
              ),
              const Text("Description :     The discription goes here."),
              const Text("Cost :     Rs. 000 /-"),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Add to cart"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Buy now"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text("Manufacturer Details : XXXXXX"),
              const Text("Delivery Details : In two days"),
              const Text("Reviews (Others)"),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: mediaQuery.height * 0.32,
                width: mediaQuery.width * 0.85,
                child: const Center(
                  child: Text("Messsage box"),
                ),
              ),
              const CustomNavButton(),
              SizedBox(
                height: mediaQuery.height * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
