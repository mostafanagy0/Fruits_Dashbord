import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';
import 'package:fruits_hub_dashbord/core/repos/imges_repo/image_repo.dart';

class ImageRepoImp implements ImageRepo {
  @override
  Future<Either<Failures, String>> uplodeImage(File image) {
    // TODO: implement uplodeImage
    throw UnimplementedError();
  }
}
