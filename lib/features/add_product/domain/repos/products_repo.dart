import 'package:fruits_hub_dashbord/features/add_product/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
