part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class CartAdded extends CartState {
  final List<ProductModel> list;
  CartAdded({
    required this.list,
  });
}
