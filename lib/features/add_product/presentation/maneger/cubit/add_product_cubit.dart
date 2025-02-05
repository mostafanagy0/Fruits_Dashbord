import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashbord/core/repos/imges_repo/image_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoding());
    var result = await imageRepo.uplodeImage(addProductInputEntity.image);

    result.fold(
      (f) {
        emit(
          AddProductFailure(f.message),
        );
      },
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) {
            emit(
              AddProductFailure(f.message),
            );
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
