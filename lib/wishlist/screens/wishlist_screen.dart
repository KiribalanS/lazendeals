import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/widgets/custom_appbar.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/widgets/products_widget.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
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
              const SizedBox(
                height: 80,
                child: Center(
                  child: Text(
                    "Wishlist",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
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
          const Positioned(
            bottom: 35,
            right: 10,
            left: 10,
            child: CustomNavButton(),
          ),
        ],
      ),
    );
  }
}
