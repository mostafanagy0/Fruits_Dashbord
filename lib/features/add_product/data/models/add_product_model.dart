import 'dart:io';

import 'package:fruits_hub_dashbord/features/add_product/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
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

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.image,
    required this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.sellingCount,
  });

  factory AddProductInputModel.fromEntity(AddProductInputEntity entity) {
    return AddProductInputModel(
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
        sellingCount: entity.sellingCount);
  }
  toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl
    };
  }
}
