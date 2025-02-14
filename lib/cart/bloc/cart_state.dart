part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<CartProductModel> list;

  CartLoaded({
    required this.list,
  });
}

class CartLoading extends CartState {}

class CartProductModel {
  ProductModel productModel;
  int quantity;
  CartProductModel({
    required this.productModel,
    required this.quantity,
  });
}
