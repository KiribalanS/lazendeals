import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/models/product_model.dart';
import './../../constants/ui_constants.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, List<ProductModel>> {
  CartBloc() : super([]) {
    on<AddCartEvent>(_addProductToCart);

    on<RemoveCartEvent>(_removeProduct);
  }
  @override
  void onChange(Change<List<ProductModel>> change) {
    // Always call super.onChange with the current change
    super.onChange(change);

    print(change);

    // Custom onChange logic goes here
  }

  void _addProductToCart(AddCartEvent event, Emitter<List<ProductModel>> emit) {
    for (var element in state) {
      if (element.productId == event.productModel.productId) {
        ScaffoldMessenger.of(event.context).clearSnackBars();
        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(
              "the product ${event.productModel.productName} is already in cart!",
            ),
          ),
        );
        return;
      }
    }
    emit([event.productModel, ...state]);
    ScaffoldMessenger.of(event.context).clearSnackBars();
    ScaffoldMessenger.of(event.context).showSnackBar(
      SnackBar(
        content: Text(
          "the product ${event.productModel.productName} is added",
        ),
      ),
    );
  }

  void _removeProduct(RemoveCartEvent event, Emitter<List<ProductModel>> emit) {
    if (state.length == 1) {
      emit(List.empty());
      UiConstants.showCustomSnackbars(
          context: event.context,
          content: "the product ${event.productModel.productName} is removed");

      return;
    }
    List<ProductModel> list = List.from(state);
    list.removeWhere(
      (element) => element.productId == event.productModel.productId,
    );
    emit(list.isEmpty ? List<ProductModel>.empty() : List.from(list));

    UiConstants.showCustomSnackbars(
        context: event.context,
        content: "the product ${event.productModel.productName} is removed");
  }
}
