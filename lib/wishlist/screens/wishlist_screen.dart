import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/widgets/custom_appbar.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/products_widget.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: customAppBar(scaffoldKey),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
            child: Text(
              "Wishlist",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: BlocConsumer<WishlistCubit, List<ProductModel>>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.isEmpty) {
                  return const Center(
                    child: Text(
                      "No data found",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return ProductsWidget(productModel: state[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
