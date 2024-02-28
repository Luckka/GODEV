import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/home/domain/repository/upload_post_repository.dart';
import 'package:godev/app/modules/home/infra/datasource/upload_post_datasource.dart';

class UploadPostRepositoryImpl implements UploadPostRepository{
  final UploadPostDatasource uploadPostDatasource;

  UploadPostRepositoryImpl({required this.uploadPostDatasource});
  @override
  Future<Either<AppExceptions, String>> call({required String description, required Uint8List file, required String uid,required String username,
    required String profileImage}) async{
    final result = await uploadPostDatasource.call(description: description, file: file, uid: uid, username: username, profileImage: profileImage);
    return result;
  }
  
}