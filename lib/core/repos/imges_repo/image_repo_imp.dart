import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/repos/imges_repo/image_repo.dart';
import 'package:fruits_hub_dashbord/core/utils/backend_endpoints.dart';

import '../../services/storage_service.dart';

class ImageRepoImp implements ImageRepo {
  final StorageService storageService;

  ImageRepoImp(this.storageService);
  @override
  @override
  Future<Either<Failures, String>> uplodeImage(File image) async {
    try {
      String url =
          await storageService.uplodeFile(image, BackendEndpoints.images);
      return right(url);
    } catch (e) {
      return left(ServerFailure('Error in uploding image'));
    }
  }
}
