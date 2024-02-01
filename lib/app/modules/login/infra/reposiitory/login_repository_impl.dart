import 'dart:typed_data';

import 'package:dart_either/src/dart_either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:godev/app/core/shared/app_exceptions.dart';
import 'package:godev/app/modules/login/domain/repository/login_repository.dart';
import 'package:godev/app/modules/login/infra/datasource/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository{
  final LoginDatasource loginDatasource;

  LoginRepositoryImpl({required this.loginDatasource});

  @override
  Future<void> call({required String user, required String password, required String email, required String bio }) async{
    final result = await loginDatasource.call(user: user, password: password, email: email, bio: bio,);

    return result;
  }

}