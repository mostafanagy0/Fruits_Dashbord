import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance;
  @override
  Future<String> uplodeFile(String file) {
    // TODO: implement uplodeFile
    throw UnimplementedError();
  }
}
