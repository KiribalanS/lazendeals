import 'package:flutter/material.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/widgets/products_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
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
          SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dummyProduct.length,
                  itemBuilder: (context, index) {
                    return ProductsWidget(
                      productModel: dummyProduct[index],
                    );
                  },
                ),
              ],
            ),
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
