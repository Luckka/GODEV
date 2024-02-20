import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/services/firebase_firestore/firestore_service.dart';
import 'package:godev/app/core/services/storage/storage_service.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import '../domain/helpers/signup_exceptions.dart';
import '../infra/datasource/signup_datasource.dart';

class SignUpDatasourceImpl implements SignUpDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirestoreService firestoreService = FirestoreService(firestore: FirebaseFirestore.instance);

  bool successNewUser = true;
  String message = '';

  @override
  Future<Either<AppExceptions,String>> call(
      {required String user,
      required String password,
      required String email,
      required String bio,
      required Uint8List file
      }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          user.isNotEmpty ||
          bio.isNotEmpty
          ) {
        final cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        
        String photoUrl = await StorageMethods().uploadImagetoStorage('profilePics', file, false);

        await firestoreService.setDataOnDocument(data: {
          'username': user,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl
        },
        documentPath: cred.user!.uid, collectionPath: 'users');

        return const Right('success');

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
