import 'dart:typed_data';

import 'package:dart_either/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';

abstract interface class UploadPostRepository {

   Future<Either<AppExceptions,String>> call({
      required String description,
      required Uint8List file,
      required String uid,
      required String username,
      required String profileImage
   });

}