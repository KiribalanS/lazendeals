import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/cart/bloc/cart_bloc.dart';
import 'package:lazendeals/models/dummy.dart';
import 'package:lazendeals/models/product_model.dart';
import 'package:lazendeals/screens/product_details_screen.dart';
import 'package:lazendeals/wishlist/cubit/wishlist_cubit.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
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
                            widget.productModel.productName,
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
                padding: const EdgeInsets.only(left: 8.0),
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
                        widget.productModel.description,
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
                            context.read<CartBloc>().add(
                                  AddCartEvent(
                                    productModel: widget.productModel,
                                    context: context,
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
                                builder: (context) => ProductDetailsScreen(
                                  productModel: dummyProduct[0],
                                ),
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
                child: BlocBuilder<WishlistCubit, List<ProductModel>>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        context
                            .read<WishlistCubit>()
                            .addToWishList(widget.productModel, context);
                      },
                      icon: Icon(
                        state.contains(widget.productModel)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                      ),
                    );
                  },
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
