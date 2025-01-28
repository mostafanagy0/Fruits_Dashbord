import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/core/helper_funcitons/on_generate_routes.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: DashbordView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
