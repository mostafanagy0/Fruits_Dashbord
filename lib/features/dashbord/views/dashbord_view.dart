import 'package:flutter/material.dart';
import 'package:fruits_hub_dashbord/features/dashbord/widgets/dashbord_view_body.dart';

class DashbordView extends StatelessWidget {
  const DashbordView({super.key});
  static const routeName = 'dashbord';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DashboardViewBody());
  }
}
