import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashbord/core/errors/failures.dart';

abstract class ImageRepo {
  Future<Either<Failures, String>> uplodeImage(File image);
}
