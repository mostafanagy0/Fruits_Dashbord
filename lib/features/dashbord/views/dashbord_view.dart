import 'package:flutter/material.dart';

class DashbordView extends StatelessWidget {
  const DashbordView({super.key});
  static const routeName = 'dashbord';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dashbord View'),
      ),
    );
  }
}
