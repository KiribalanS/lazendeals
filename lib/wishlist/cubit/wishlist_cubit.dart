import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/constants/ui_constants.dart';
import 'package:lazendeals/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<List<ProductModel>> {
  WishlistCubit() : super([]);

  void addToWishList(ProductModel productModel, BuildContext context) {
    for (var e in state) {
      if (e.productId == productModel.productId) {
        removeFromWishList(productModel, context);
        return;
      }
    }
    emit([...state, productModel]);
    UiConstants.showCustomSnackbars(
        context: context,
        content:
            "The product ${productModel.productName} is added to wishlist");
  }

  void removeFromWishList(ProductModel productModel, BuildContext context) {
    if (state.length == 1) {
      emit(List.empty());
      UiConstants.showCustomSnackbars(
          context: context,
          content:
              "The product ${productModel.productName} is removed from wishlist");

      return;
    }
    List<ProductModel> list = state;

    list.removeWhere(
      (element) => element.productId == productModel.productId,
    );

    emit(List.from(list));
    UiConstants.showCustomSnackbars(
        context: context,
        content:
            "The product ${productModel.productName} is removed from wishlist");
  }
}
