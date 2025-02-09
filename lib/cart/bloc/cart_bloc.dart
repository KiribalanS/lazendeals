import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, List<ProductModel>> {
  CartBloc() : super([]) {
    on<AddCartEvent>((event, emit) {
      emit([event.productModel, ...state]);
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(
            "the product ${event.productModel.productName} is added",
          ),
        ),
      );
    });

    on<RemoveCartEvent>((event, emit) {
      state.remove(event.productModel);
      List<ProductModel> list = state;
      emit([...list]);
      ScaffoldMessenger.of(event.context).showSnackBar(
        SnackBar(
          content: Text(
            "the product ${event.productModel.productName} is removed",
          ),
        ),
      );
    });
  }
}
