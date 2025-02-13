part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddCartEvent extends CartEvent {
  final ProductModel productModel;
  final BuildContext context;

  AddCartEvent({required this.productModel, required this.context});
}

class RemoveCartEvent extends CartEvent {
  final ProductModel productModel;
  final BuildContext context;

  RemoveCartEvent({required this.productModel, required this.context});
}

class BuyCartEvent extends CartEvent {}
