import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(
      AddProductInputEntity addProductInputEntity);
}
