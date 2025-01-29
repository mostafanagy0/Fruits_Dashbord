import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashbordView.routeName:
      return MaterialPageRoute(builder: (context) => const DashbordView());
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
