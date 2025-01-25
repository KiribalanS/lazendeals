enum ProductSize { XS, S, M, L, XL, XXL }

class ProductModel {
  String productName;
  String category;
  String productId;
  String description;
  double price;
  int delivery;
  String manufacturer;
  List<String>? review;
  String productImage;
  ProductSize? productSize;
  bool? isLiked;

  ProductModel({
    required this.category,
    required this.productName,
    required this.delivery,
    required this.description,
    required this.manufacturer,
    required this.price,
    required this.productId,
    required this.productImage,
    required this.review,
    this.isLiked,
    this.productSize,
  });
}
