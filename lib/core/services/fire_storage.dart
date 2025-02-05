import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashbord/core/services/storage_service.dart';
import 'package:path/path.dart' as b;

class FireStorage implements StorageService {
  final storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uplodeFile(File file, String path) async {
    // to find URL
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);

    // refrance to the file
    var fileRefarence =
        storageReference.child('$path/$fileName.$extensionName');
    await fileRefarence.putFile(file);
    var imageUrl = fileRefarence.getDownloadURL();
    return imageUrl;
  }
}
