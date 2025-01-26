import 'package:flutter/material.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/widgets/my_cart_widget.dart';
import 'package:lazendeals/widgets/my_order_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lazendeals"),
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Your Cart",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: MyCartWidget(),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
          const CustomNavButton(),
        ],
      ),
    );
  }
}
