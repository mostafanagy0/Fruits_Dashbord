import 'package:fruits_hub_dashbord/core/services/fire_storage.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(FireStorage());
}
