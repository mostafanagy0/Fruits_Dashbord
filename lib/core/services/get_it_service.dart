import 'package:fruits_hub_dashbord/core/repos/imges_repo/image_repo_imp.dart';
import 'package:fruits_hub_dashbord/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashbord/core/repos/product_repo/products_repo_imp.dart';
import 'package:fruits_hub_dashbord/core/services/database_service.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:fruits_hub_dashbord/core/services/supabase_Storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/imges_repo/image_repo.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DataBaseService>(FirestoreServices());
  getIt.registerSingleton<ImageRepo>(ImageRepoImp(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductsRepo>(
      ProductsRepoImp(getIt.get<DataBaseService>()));
}
