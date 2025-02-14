import 'package:lazendeals/models/category_model.dart';
import 'package:lazendeals/models/product_model.dart';

List<CategoryModel> dummyCategory = [
  CategoryModel(category: "Organic Foods and Grocery", categoryId: 1),
  CategoryModel(category: "Organic Cosmetics", categoryId: 2),
  CategoryModel(category: "Fashion and Accessories (HANDMADE)", categoryId: 3),
  CategoryModel(category: "Kitchen Accessories", categoryId: 4),
  CategoryModel(category: "Home Accessories", categoryId: 5),
  CategoryModel(category: "Tamilnadu’s Iconic Snack", categoryId: 6),
  CategoryModel(category: "Clothing", categoryId: 7),
  CategoryModel(category: "Gifts", categoryId: 8),
  CategoryModel(category: "Paintings", categoryId: 9),
];

List<ProductModel> dummyProduct = [
  ProductModel(
    category: "Electronics",
    productName: "Wireless Earbuds",
    delivery: 3,
    description: "High-quality wireless earbuds with noise cancellation.",
    manufacturer: "SoundTech",
    price: 129.99,
    productId: "PRD12345",
    productImage: 'https://example.com/images/earbuds.png',
    review: [
      "Great sound quality",
      "Comfortable to wear",
      "Excellent battery life"
    ],
    isLiked: true,
  ),
  ProductModel(
    category: "Home Appliances",
    productName: "Air Purifier",
    delivery: 5,
    description: "Compact air purifier with HEPA filter for clean air.",
    manufacturer: "PureAir",
    price: 249.99,
    productId: "PRD67890",
    productImage: 'https://example.com/images/airpurifier.png',
    review: ["Works well in small spaces", "Quiet operation", "Easy to use"],
    isLiked: false,
  ),
  ProductModel(
    category: "Fashion",
    productName: "Leather Wallet",
    delivery: 2,
    description: "Genuine leather wallet with multiple card slots.",
    manufacturer: "StyleCraft",
    price: 59.99,
    productId: "PRD98765",
    productImage: 'https://example.com/images/wallet.png',
    review: ["Elegant design", "Durable material", "Good value for money"],
    isLiked: true,
  ),
];
