import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/services/firebase_firestore/firestore_service.dart';
import 'package:godev/app/core/services/storage/storage_service.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/core/shared/entity/user_entity.dart';
import 'package:godev/app/modules/signup/infra/mappers/user_mapper.dart' as model;
import '../domain/helpers/signup_exceptions.dart';
import '../infra/datasource/signup_datasource.dart';

class SignUpDatasourceImpl implements SignUpDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirestoreService firestoreService =
      FirestoreService(firestore: FirebaseFirestore.instance);

  bool successNewUser = true;
  String message = '';
  UserEntity? userEntity;

  @override
  Future<Either<AppExceptions, UserEntity>> call(
      {required String user,
      required String password,
      required String email,
      required String bio,
      required Uint8List file,
      }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          user.isNotEmpty ||
          bio.isNotEmpty) {
        final cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImagetoStorage('profilePics', file, false);

        model.UserMapper userMapper = model.UserMapper(
            email: email,
            photoUrl: photoUrl,
            username: user,
            bio: bio,
            followers: [],
            following: [],
            uid: cred.user!.uid,);

        await firestoreService.setDataOnDocument(documentPath: cred.user!.uid, collectionPath: 'users', data: userMapper.toMap());

        return Right(userMapper.fromMap(userMapper.toMap()));
      }

      message = "Usuário ou senha invalido";
      throw SignUpException(message: message, stackTrace: null);
    } catch (err, s) {
      message = err.toString();
      successNewUser = false;
      return Left(SignUpException(message: err.toString(), stackTrace: s));
    }
  }
}
