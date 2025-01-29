import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: 'Add Data',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProductView.routeName);
            },
            text: 'View Orders',
          ),
        ],
      ),
    );
  }
}
