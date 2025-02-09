import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/cart/widgets/my_cart_widget.dart';

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
      body: Stack(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your Cart",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocConsumer<CartBloc, List<ProductModel>>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.length,
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
                  );
                },
              ),
            ],
          ),
          const Positioned(
            bottom: 35,
            left: 10,
            right: 10,
            child: CustomNavButton(),
          ),
        ],
      ),
    );
  }
}
