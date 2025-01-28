import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashbordView.routeName:
      return MaterialPageRoute(builder: (context) => const DashbordView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
