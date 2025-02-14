import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/cart/screens/cart_screen.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/screens/confirm_address.dart';
import 'package:lazendeals/widgets/advertisement_widget.dart';
import 'package:lazendeals/widgets/custom_appbar.dart';
import 'package:lazendeals/widgets/custom_drawer.dart';
import 'package:lazendeals/widgets/custom_nav_button.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: customAppBar(scaffoldKey),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const AdvertisementWidget(),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/jwel.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(),
                  ),
                  height: mediaQuery.height * 0.21,
                  width: mediaQuery.width * 0.85,
                  child: Padding(
                    padding: const EdgeInsets.all(0.8),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Container(
                        height: 37,
                        width: constraints.maxWidth,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Color.fromRGBO(251, 215, 187, 1),
                        ),
                        child: Center(
                          child: Text(
                            dummyProduct[0].productName,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: mediaQuery.height * 0.1,
                  width: mediaQuery.width * 0.85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BlocBuilder<WishlistCubit, List<ProductModel>>(
                            builder: (context, state) {
                              return IconButton(
                                onPressed: () {
                                  context.read<WishlistCubit>().addToWishList(
                                      widget.productModel, context);
                                },
                                icon: Icon(
                                  state.contains(widget.productModel)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Cost",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Rs. 000 /-",
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text.rich(
                      TextSpan(
                          text: 'Description  : ',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          children: <InlineSpan>[
                            TextSpan(
                              text: dummyProduct[0].description,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal),
                            )
                          ]),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(251, 215, 187, 1)),
                  onPressed: () {
                    context.read<CartBloc>().add(
                          AddCartEvent(
                              productModel: dummyProduct[0], context: context),
                        );
                  },
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                      "Add to Cart",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(251, 215, 187, 1)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmAddress(
                          productModel: dummyProduct[0],
                        ),
                      ),
                    );
                  },
                  child: const SizedBox(
                    width: 250,
                    child: Text(
                      "Buy now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text("Manufacturer Details : XXXXXX"),
                const Text("Delivery Details : In two days"),
                const Text(
                    "Message for delivery<Landmarks, instructions, etc.. (Others)"),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .85,
                    child: TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.send),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: "Message box",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 65,
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: CustomNavButton(),
          ),
        ],
      ),
    );
  }
}
