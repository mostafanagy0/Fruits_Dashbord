import 'dart:io';

import 'package:fruits_hub_dashbord/features/add_product/data/models/review_model.dart';
import 'package:fruits_hub_dashbord/features/add_product/domain/entities/product_input_entity.dart';

class ProductInputModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.reviews,
    required this.isFeatured,
    required this.image,
    required this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    this.sellingCount = 0,
  });

  factory ProductInputModel.fromEntity(ProductInputEntity entity) {
    return ProductInputModel(
      reviews: entity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      isFeatured: entity.isFeatured,
      image: entity.image,
      imageUrl: entity.imageUrl,
      expirationsMonths: entity.expirationsMonths,
      isOrganic: entity.isOrganic,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
    );
  }
  toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'sellingCount': sellingCount,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
    };
  }
}
