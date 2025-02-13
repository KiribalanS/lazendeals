import 'dart:convert';

import 'package:flutter/widgets.dart';

class CategoryModel {
  String category;
  String? categoryImage;
  int categoryId;

  CategoryModel({
    required this.category,
    this.categoryImage,
    required this.categoryId,
  });

  CategoryModel copyWith({
    String? category,
    ValueGetter<String?>? categoryImage,
    int? categoryId,
  }) {
    return CategoryModel(
      category: category ?? this.category,
      categoryImage:
          categoryImage != null ? categoryImage() : this.categoryImage,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'categoryImage': categoryImage,
      'categoryId': categoryId,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      category: map['category'] ?? '',
      categoryImage: map['categoryImage'],
      categoryId: map['categoryId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryModel(category: $category, categoryImage: $categoryImage, categoryId: $categoryId)';
}
