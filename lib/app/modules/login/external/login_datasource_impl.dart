import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:godev/app/core/shared/app_exceptions.dart';

import 'package:godev/app/modules/login/infra/mappers/login_mappers.dart';

import '../domain/helpers/login_exceptions.dart';
import '../infra/datasource/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<void> call(
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

       await _firestore.collection('users').doc(cred.user!.uid).set({
            'username': user,
            'uid': cred.user!.uid,
            'email': email,
            'bio': bio,
            'followers': [],
            'following': []
        });
       res = 'success';

      }

      message = "Usuário ou senha invalido";
      throw LoginException(message: message, stackTrace: null);
    } catch (err, s) {
       print(err);
    }
  }
}
