import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/services/get_it_service.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/maneger/cubit/add_product_cubit.dart';

import '../../../../core/repos/imges_repo/image_repo.dart';
import '../widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'addProduct';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AddProductCubit(
            getIt.get<ImageRepo>(),
            getIt.get<ProductsRepo>(),
          ),
          child: const AddproductviewBodyBlocBuilder(),
        ),
      ),
    );
  }
}
