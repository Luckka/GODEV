import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:godev/app/core/services/storage/storage_service.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/home/domain/helpers/upload_post_exception.dart';
import 'package:godev/app/modules/home/infra/datasource/upload_post_datasource.dart';
import 'package:godev/app/modules/home/infra/mappers/user_post_mapper.dart';
import 'package:uuid/uuid.dart';

class UploadPostDatasourceImpl implements UploadPostDatasource{

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<AppExceptions, String>> call({required String description, required Uint8List file, required String uid,required String username,
    required String profileImage}) async{
    try{
      String photoUrl = await StorageMethods().uploadImagetoStorage('posts', file, true);

      String postId = const Uuid().v1();

      UserPostMapper userPostMapper = UserPostMapper(datePublished: DateTime.now(), description: description, postId: postId, postImage: profileImage, postUrl: photoUrl, uid: uid, username:username, likes: []);

      firestore.collection('posts').doc(postId).set(userPostMapper.toMap());

      return Right('Right');

    }

    catch(err){
      Left(UploadPostException(message: 'err', stackTrace: null));
    }
    throw UploadPostException(message: 'Error', stackTrace: null);

  }

}