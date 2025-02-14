import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/widgets/custom_appbar.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/cart/widgets/my_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
      ),
      appBar: customAppBar(scaffoldKey),
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
                  if (state.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight:
                                    MediaQuery.of(context).size.height * 0.4),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MyCartWidget(
                                            productModel: state[index]),
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const Text(
                            "Price details : ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const CustomRow(
                            content1: "Price ",
                            content2: "Rs : 240",
                          ),
                          const CustomRow(
                            content1: "Discount ",
                            content2: "Rs : 0.0",
                          ),
                          const CustomRow(
                            content1: "Delivery charges ",
                            content2: "Rs : 40",
                          ),
                          const CustomRow(
                            content1: "Total amount ",
                            content2: "Rs : 280",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 15),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      child: const Text(
                                        "Rs : 280",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Place order",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
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

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.content1, required this.content2});
  final String content1;
  final String content2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Text(
              content1,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Text(
            content2,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
