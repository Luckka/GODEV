import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:godev/app/core/services/firebase_firestore/firestore_service.dart';

import 'package:godev/app/core/shared/app_exceptions.dart';


import '../domain/helpers/signup_exceptions.dart';
import '../infra/datasource/signup_datasource.dart';

class SignUpDatasourceImpl implements SignUpDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirestoreService firestoreService = FirestoreService(firestore: FirebaseFirestore.instance);

  @override
  Future<String> call(
      {required String user,
      required String password,
      required String email,
      required String bio,
      }) async {
    String res = 'Some error occured';
    String message = '';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          user.isNotEmpty ||
          bio.isNotEmpty
          ) {
        final cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await firestoreService.setDataOnDocument(data: {
          'username': user,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
        },
        documentPath: cred.user!.uid, collectionPath: 'users');

        return 'success';

      }

      message = "Usuário ou senha invalido";
      throw SignUpException(message: message, stackTrace: null);
    } catch (err, s) {
        return 'error';
    }
  }
}
