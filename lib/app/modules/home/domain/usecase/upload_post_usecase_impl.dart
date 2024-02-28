import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/home/domain/usecase/upload_post_usecase.dart';

class UploadPostUseCaseImpl implements UploadPostUseCase{

  @override
  Future<Either<AppExceptions, String>> call({required String description, required Uint8List file, required String uid,required String username,
    required String profileImage}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}