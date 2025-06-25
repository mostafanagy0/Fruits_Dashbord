import 'dart:io';

import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:fruits_hub_dashbord/core/utils/backend_endpoints.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  /// initialize Supabase once (call in main)
  static Future<void> initSupabase() async {
    await Supabase.initialize(
      url: BackendEndpoints.kSupabaseUrl,
      anonKey: BackendEndpoints.kSupabaseKey,
    );
  }

  /// create bucket if it doesn't exist
  // recomended to crate bucket from supabase dashboard but you can use this method to create bucket programmatically
  static Future<void> createBucketIfNotExists(String bucketName) async {
    final client = Supabase.instance.client;
    final buckets = await client.storage.listBuckets();

    final isExist = buckets.any((bucket) => bucket.id == bucketName);
    if (!isExist) {
      await client.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uplodeFile(File file, String path) async {
    final client = Supabase.instance.client;
    final fileName = b.basenameWithoutExtension(file.path);
    final extension = b.extension(file.path);

    final filePath = '$path/$fileName$extension';

    await client.storage.from('fruits_images').upload(filePath, file);

    final publicUrl =
        client.storage.from('fruits_images').getPublicUrl(filePath);

    return publicUrl;
  }
}
