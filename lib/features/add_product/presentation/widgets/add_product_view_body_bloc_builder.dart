import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/helper_funcitons/build_snack_bar.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_progres_hud.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/maneger/cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/widgets/add_product_view_body.dart';

class AddproductviewBodyBlocBuilder extends StatelessWidget {
  const AddproductviewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSnackBar(context, 'Product Added Successfully');
        }
        if (state is AddProductFailure) {
          buildSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            inAsyncCall: state is AddProductLoding,
            child: const AddProductViewBody());
      },
    );
  }
}
