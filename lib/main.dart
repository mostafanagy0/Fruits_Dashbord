import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashbord/core/helper_funcitons/on_generate_routes.dart';
import 'package:fruits_hub_dashbord/core/services/get_it_service.dart';
import 'package:fruits_hub_dashbord/features/dashbord/views/dashbord_view.dart';
import 'package:fruits_hub_dashbord/firebase_options.dart';

import 'core/services/custom_bloc_observer.dart';
import 'core/services/supabase_Storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SupabaseStorageService.initSupabase();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(const MainApp());
  setup();
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
