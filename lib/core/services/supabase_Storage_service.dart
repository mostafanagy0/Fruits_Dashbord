import 'dart:io';

import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:fruits_hub_dashbord/core/utils/backend_endpoints.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: BackendEndpoints.KSupabaseUrl,
      anonKey: BackendEndpoints.KSupabaseKey,
    );
  }

  @override

  // file is the file that we want to upload
  // path is the path where we want to upload the file
  Future<String> uplodeFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', file);
    return result;
  }
}
