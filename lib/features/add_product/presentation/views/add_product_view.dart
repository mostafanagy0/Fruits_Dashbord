import 'package:flutter/material.dart';

import '../widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});
  static const routeName = 'addProduct';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AddProductViewBody(),
      ),
    );
  }
}
