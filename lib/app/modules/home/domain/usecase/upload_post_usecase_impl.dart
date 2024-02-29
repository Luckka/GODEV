import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/home/domain/repository/upload_post_repository.dart';
import 'package:godev/app/modules/home/domain/usecase/upload_post_usecase.dart';

class UploadPostUseCaseImpl implements UploadPostUseCase{
  final UploadPostRepository uploadPostRepository;

  UploadPostUseCaseImpl({required this.uploadPostRepository});

  @override
  Future<Either<AppExceptions, String>> call({required String description, required Uint8List file, required String uid,required String username,
    required String profileImage}) async{
     final result = await uploadPostRepository.call(description: description, file: file, uid: uid, username: username, profileImage: profileImage);

     return result;
  }

}