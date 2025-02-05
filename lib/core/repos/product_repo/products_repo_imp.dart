import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/services/database_service.dart';
import 'package:fruits_hub_dashbord/core/utils/backend_endpoints.dart';
import 'package:fruits_hub_dashbord/features/add_product/domain/entities/add_product_input_entity.dart';

import '../../../features/add_product/data/models/add_product_model.dart';

class ProductsRepoImp implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImp(this.dataBaseService);
  @override
  Future<Either<Failures, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoints.addProducts,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toMap(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure('Error in adding product'));
    }
  }
}
